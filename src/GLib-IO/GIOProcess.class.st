"
An object to wrap the output of a GSpawn
"
Class {
	#name : #GIOProcess,
	#superclass : #Object,
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#instVars : [
		'pid',
		'inFd',
		'outFd',
		'errFd',
		'outChannel',
		'inChannel',
		'errChannel',
		'callbacks'
	],
	#pools : [
		'GSpawnFlags',
		'GtkTypes'
	],
	#category : #'GLib-IO'
}

{ #category : #private }
GIOProcess class >> gSpawnAsyncWithPipes: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data [
	| gPidOut stdinFdOut stdoutFdOut stderrFdOut error result |
	
	gPidOut := FFIInt32 newBuffer.
	stdinFdOut := FFIInt32 newBuffer.
	stdoutFdOut := FFIInt32 newBuffer.
	stderrFdOut := FFIInt32 newBuffer.
	error := GError new.
	
	result := self 
		gSpawnAsyncWithPipes: working_directory 
		argv: argv
		envp: envp
		flags: flags 
		childSetup: child_setup 
		data: user_data 
		childPidOut: gPidOut 
		stdinPipeOut: stdinFdOut 
		stdoutPipeOut: stdoutFdOut  
		stderrPipeOut: stderrFdOut 
		error: error.
	result ifFalse: [ 
		self error: error messageString ].
	
	^ self basicNew 
		initializePid: (gPidOut signedLongAt: 1)
			in: (stdinFdOut signedLongAt: 1)
			out: (stdoutFdOut signedLongAt: 1)
			err: (stderrFdOut signedLongAt: 1);
		yourself
]

{ #category : #private }
GIOProcess class >> gSpawnAsyncWithPipes: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data childPidOut: child_pid_out stdinPipeOut: stdin_pipe_out stdoutPipeOut: stdout_pipe_out stderrPipeOut: stderr_pipe_out error: error [
	"void (*GSpawnChildSetupFunc) (gpointer user_data)"

	self ffiCall: #(gboolean g_spawn_async_with_pipes (
		const gchar *working_directory,
		"const gchar **"void *argv,
 		"const gchar **"void *envp,
		GSpawnFlags flags,
 		"GSpawnChildSetupFunc "void *child_setup,
		gpointer user_data,
		"GPid *"void *child_pid_out,
		"gint *"void *stdin_pipe_out,
		"gint *"void *stdout_pipe_out,
		"gint *"void *stderr_pipe_out,
		"GError **"GError *error))
]

{ #category : #private }
GIOProcess class >> gSpawnAsyncWithPipes: working_directory command: command arguments: anArray flags: flags childSetup: child_setup data: user_data [
	| argv envp |

	envp := ExternalAddress null.
	argv := ExternalAddress arrayOfStringsFrom: { command }, anArray.
	^ [
			self 
				gSpawnAsyncWithPipes: working_directory 
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
GIOProcess class >> spawn: command arguments: anArray flags: flags [

	^ self 
		gSpawnAsyncWithPipes: nil "working directory" 
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

	self gSpawnClose.
	inChannel ifNotNil: [ inChannel shutDown: true ].
	outChannel ifNotNil: [ outChannel shutDown: true ].	
	errChannel ifNotNil: [ errChannel shutDown: true ]
]

{ #category : #accessing }
GIOProcess >> errChannel [

	^ errChannel ifNil: [ errChannel := self newChannel: errFd ]
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

{ #category : #accessing }
GIOProcess >> inChannel [

	^ inChannel ifNil: [ inChannel := self newChannel: inFd ]
]

{ #category : #initialization }
GIOProcess >> initializePid: pidNum in: stdinFd out: stdoutFd err: stderrFd [

	self initialize.
	pid := pidNum. 
	inFd := stdinFd. 
	outFd := stdoutFd. 
	errFd := stderrFd.
	self watch: [ :status | self close ]
]

{ #category : #'private - factory' }
GIOProcess >> newChannel: fd [

	^ GIOChannel newFromFileDescriptor: fd
]

{ #category : #accessing }
GIOProcess >> outChannel [

	^ outChannel ifNil: [ outChannel := self newChannel: outFd ]
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
