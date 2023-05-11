"
A wrapper to spawn synchronously subprocesses with GLib (waits for the child to exit before returning).
See https://docs.gtk.org/glib/func.spawn_sync.html
"
Class {
	#name : #GIOSyncProcess,
	#superclass : #Object,
	#traits : 'GLibIOTLibrary',
	#classTraits : 'GLibIOTLibrary classTrait',
	#instVars : [
		'errorHolder',
		'isSuccess',
		'arguments',
		'environment',
		'standardError',
		'standardOutput',
		'waitStatus'
	],
	#pools : [
		'GSpawnError',
		'GSpawnFlags',
		'GtkTypes'
	],
	#category : #'GLib-IO-Process'
}

{ #category : #'instance creation' }
GIOSyncProcess class >> spawn: command arguments: anArray workingDirectory: workingdirectory flags: flags processInfo: processInfo [

	^ self new
		gSpawnSync: (workingdirectory ifNotNil: [ workingdirectory fullName ])
		command: command 
		arguments: anArray 
		flags: flags 
		childSetup: ExternalAddress null 
		data: ExternalAddress null
		processInfo: processInfo
]

{ #category : #private }
GIOSyncProcess >> basicgSpawnSync: working_directory command: command arguments: anArray flags: flags childSetup: child_setup data: user_data processInfo: processInfo [

	arguments := ExternalAddress arrayOfStringsFrom: { command } , anArray.

	isSuccess := self
		             gSpawnSync: working_directory
		             argv: arguments
		             envp: environment
		             flags: flags
		             childSetup: child_setup
		             data: user_data
		             standard_output: standardOutput
		             standard_error: standardError
		             wait_status: waitStatus
		             error: errorHolder.
	self setErrorIfAny: processInfo.
	self setExitCodeIfNoError: processInfo.
	^ processInfo
		stdOut: standardOutput value readString;
		stdErr: standardError value readString;
		success: isSuccess;
		yourself
]

{ #category : #private }
GIOSyncProcess >> gSpawnSync: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data standard_output: standard_output standard_error: standard_error wait_status: wait_status error: error [
	"bgboolean
g_spawn_sync (
  const gchar* working_directory,
  gchar** argv,
  gchar** envp,
  GSpawnFlags flags,
  GSpawnChildSetupFunc child_setup,
  gpointer user_data,
  gchar** standard_output,
  gchar** standard_error,
  gint* wait_status,
  GError** error
)"

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
		gpointerHolder error))
]

{ #category : #private }
GIOSyncProcess >> gSpawnSync: working_directory command: command arguments: anArray flags: flags childSetup: child_setup data: user_data processInfo: processInfo [

	^ [ 
	  self
		  basicgSpawnSync: working_directory
		  command: command
		  arguments: anArray
		  flags: flags
		  childSetup: child_setup
		  data: user_data
		  processInfo: processInfo 
	] ensure: [ 
		  arguments freeArrayOfStrings. arguments := nil.
		  standardOutput value gFree. standardOutput := nil.
		  standardError value gFree. standardError := nil.
	]
]

{ #category : #initialization }
GIOSyncProcess >> initialize [

	super initialize.
	environment := ExternalAddress null.
	waitStatus := FFIInt32 newBuffer.
	errorHolder := gpointerHolder new.
	standardOutput := gpointerHolder new.
	standardError := gpointerHolder new
]

{ #category : #accessing }
GIOSyncProcess >> isSuccess [ 

	^ isSuccess
]

{ #category : #private }
GIOSyncProcess >> setErrorIfAny: processInfo [
	| error |

	self isSuccess ifTrue: [ ^ self ].
	
	[  error := GError fromHandle: errorHolder value.
		processInfo
			  errorMessage: error messageString
			  errorCode: error code
			  domainString: error domainString.
	] ensure: [ 
		error free. errorHolder := nil. ]
]

{ #category : #private }
GIOSyncProcess >> setExitCodeIfNoError: processInfo [

	self isSuccess ifFalse: [ ^ self ].
	
	processInfo exitCode: (waitStatus signedLongAt: 1).
]
