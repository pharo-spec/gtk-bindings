Class {
	#name : #GIOSyncProcess,
	#superclass : #Object,
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#pools : [
		'GSpawnFlags',
		'GtkTypes'
	],
	#category : #'GLib-IO'
}

{ #category : #options }
GIOSyncProcess class >> gSpawnSync: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data standard_output: standard_output standard_error: standard_error wait_status: wait_status error: error [
	"bool spawn_sync (string? working_directory, string[] argv, string[]? envp, SpawnFlags _flags, SpawnChildSetupFunc? child_setup, out string standard_output = null, out string standard_error = null, out int wait_status = null) throws SpawnError "
	"void (*GSpawnChildSetupFunc) (gpointer user_data)"

	self ffiCall: #(gboolean g_spawn_sync (
		const gchar *working_directory,
		"const gchar **"void *argv,
 		"const gchar **"void *envp,
		GSpawnFlags flags,
 		"GSpawnChildSetupFunc "void *child_setup,
		gpointer user_data,
		gpointerHolder standard_output,
		gpointerHolder standard_error,
		gint* wait_status,
		GError *error))
]

{ #category : #'as yet unclassified' }
GIOSyncProcess class >> gSpawnSync: working_directory command: command arguments: anArray flags: flags childSetup: child_setup data: user_data [
	| argv envp error standard_output standard_error return wait_status |

	envp := ExternalAddress null.
	argv := ExternalAddress arrayOfStringsFrom: { command }, anArray.
	wait_status := FFIInt32 newBuffer.
	error := GError new.
	standard_output := gpointerHolder new.
	standard_error := gpointerHolder new.
		
	^ [
			return := self 
				gSpawnSync: working_directory 
				argv: argv 
				envp: envp 
				flags: flags 
				childSetup: child_setup 
				data: user_data
				standard_output: standard_output 
				standard_error: standard_error
				wait_status: wait_status
				error: error.
		^ return 
			ifTrue:[ 	standard_output value readStringUTF8]
			ifFalse: [ standard_error value readStringUTF8]
				]
		ensure: [ 
			argv freeArrayOfStrings.
			standard_output value gFree.
			standard_error value gFree.
			 ]
]

{ #category : #'instance creation' }
GIOSyncProcess class >> spawn: command arguments: anArray flags: flags [

	^ self 
		gSpawnSync: nil "working directory" 
		command: command 
		arguments: anArray 
		flags: flags 
		childSetup: ExternalAddress null 
		data: ExternalAddress null
]
