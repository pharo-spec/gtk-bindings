"
An object to wrap the output of a GSpawn
"
Class {
	#name : #GIOProcess,
	#superclass : #Object,
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#instVars : [
		'pid',
		'callbacks'
	],
	#pools : [
		'GSpawnFlags',
		'GtkTypes'
	],
	#category : #'GLib-IO'
}

{ #category : #private }
GIOProcess class >> gSpawnAsync: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data [
	| gPidOut error result |

	gPidOut := FFIInt32 newBuffer.
	error := GErrorHolder new.	
	
	result := self 
		gSpawnAsync: working_directory 
		argv: argv
		envp: envp
		flags: flags 
		childSetup: child_setup 
		data: user_data 
		childPidOut: gPidOut 
		error: error.

	result ifFalse: [ 
		self error: error value messageString ].
	
	^ self basicNew 
		initializePid: (gPidOut signedLongAt: 1);
		yourself
]

{ #category : #private }
GIOProcess class >> gSpawnAsync: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data childPidOut: child_pid_out error: error [
	"void (*GSpawnChildSetupFunc) (gpointer user_data)"

	self ffiCall: #(gboolean g_spawn_async (
		const gchar *working_directory,
		"const gchar **"void *argv,
 		"const gchar **"void *envp,
		GSpawnFlags flags,
 		"GSpawnChildSetupFunc "void *child_setup,
		gpointer user_data,
		"GPid *"void *child_pid_out,
		"GError **"GErrorHolder error))
]

{ #category : #private }
GIOProcess class >> gSpawnAsync: working_directory command: command arguments: anArray flags: flags childSetup: child_setup data: user_data [
	| argv envp |

	envp := ExternalAddress null.
	argv := ExternalAddress arrayOfStringsFrom: { command }, anArray.
	^ [
			self 
				gSpawnAsync: working_directory 
				argv: argv 
				envp: envp 
				flags: flags 
				childSetup: child_setup 
				data: user_data ]
		ensure: [ 
			argv freeArrayOfStrings ]
]

{ #category : #'instance creation' }
GIOProcess class >> spawn: command [

	^ self spawn: command flags: G_SPAWN_DEFAULT
]

{ #category : #'instance creation' }
GIOProcess class >> spawn: command arguments: anArray [

	^ self 
		spawn: command 
		arguments: anArray
		flags: G_SPAWN_DEFAULT
]

{ #category : #'instance creation' }
GIOProcess class >> spawn: command arguments: anArray flags: flags [

	^ self 
		gSpawnAsync: nil "working directory" 
		command: command 
		arguments: anArray 
		flags: flags 
		childSetup: ExternalAddress null 
		data: ExternalAddress null
]

{ #category : #'instance creation' }
GIOProcess class >> spawn: command flags: flags [

	^ self spawn: command arguments: #() flags: flags
]

{ #category : #accessing }
GIOProcess >> close [

	self gSpawnClose
]

{ #category : #accessing }
GIOProcess >> forceTerminate [

	LibC system: ('kill -9 {1}' format: { self pid })
]

{ #category : #private }
GIOProcess >> gChildWatchAdd: function [

	^ self ffiCall: #(guint 
		g_child_watch_add (
  		"GPid"int pid,
  		"GChildWatchFunc"GCallback function,
  		"gpointer data"NULL))

]

{ #category : #private }
GIOProcess >> gSpawnClose [

	^ self ffiCall: #(void g_spawn_close_pid (GPid pid))
]

{ #category : #initialization }
GIOProcess >> initializePid: pidNum [

	self initialize.
	pid := pidNum. 
	self watch: [ :status | self close ]
]

{ #category : #accessing }
GIOProcess >> pid [

	^ pid
]

{ #category : #accessing }
GIOProcess >> watch: aBlock [ 
	| callback |

	callback := GCallback 
		signature: #(void (GPid pidNum, gint wait_status, gpointer user_data)) 
		block: [ :pidNum :status :data | aBlock value: status ]. 
	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: callback.
	self gChildWatchAdd: callback
]
