Class {
	#name : 'GIOPipedProcess',
	#superclass : 'GIOProcess',
	#instVars : [
		'errChannel',
		'inChannel',
		'outChannel',
		'errFd',
		'inFd',
		'outFd'
	],
	#category : 'GLib-IO-Process',
	#package : 'GLib-IO',
	#tag : 'Process'
}

{ #category : 'private' }
GIOPipedProcess class >> gSpawnAsyncWithPipes: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data [
	| gPidOut stdinFdOut stdoutFdOut stderrFdOut error result |
	
	gPidOut := FFIInt32 newBuffer.
	stdinFdOut := FFIInt32 newBuffer.
	stdoutFdOut := FFIInt32 newBuffer.
	stderrFdOut := FFIInt32 newBuffer.
	error := GErrorHolder new.
	
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
		self error: error value messageString ].
	
	^ self basicNew 
		initializePid: (gPidOut signedLongAt: 1)
			in: (stdinFdOut signedLongAt: 1)
			out: (stdoutFdOut signedLongAt: 1)
			err: (stderrFdOut signedLongAt: 1);
		yourself
]

{ #category : 'private' }
GIOPipedProcess class >> gSpawnAsyncWithPipes: working_directory argv: argv envp: envp flags: flags childSetup: child_setup data: user_data childPidOut: child_pid_out stdinPipeOut: stdin_pipe_out stdoutPipeOut: stdout_pipe_out stderrPipeOut: stderr_pipe_out error: error [
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
		"GError **"GErrorHolder error))
]

{ #category : 'private' }
GIOPipedProcess class >> gSpawnAsyncWithPipes: working_directory command: command arguments: anArray flags: flags childSetup: child_setup data: user_data [
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

{ #category : 'instance creation' }
GIOPipedProcess class >> spawn: command arguments: anArray workingDirectory: workingDir flags: flags [

	^ self 
		gSpawnAsyncWithPipes: workingDir
		command: command 
		arguments: anArray 
		flags: flags 
		childSetup: ExternalAddress null 
		data: ExternalAddress null
]

{ #category : 'initialize-release' }
GIOPipedProcess >> close [

	super close.
	inChannel ifNotNil: [ inChannel shutDown: true ].
	outChannel ifNotNil: [ outChannel shutDown: true ].	
	errChannel ifNotNil: [ errChannel shutDown: true ]
]

{ #category : 'accessing' }
GIOPipedProcess >> errChannel [

	^ errChannel ifNil: [ errChannel := self newChannel: errFd ]
]

{ #category : 'accessing' }
GIOPipedProcess >> inChannel [

	^ inChannel ifNil: [ inChannel := self newChannel: inFd ]
]

{ #category : 'initialization' }
GIOPipedProcess >> initializePid: pidNum in: stdinFd out: stdoutFd err: stderrFd [

	self initializePid: pidNum.
	pid := pidNum. 
	inFd := stdinFd. 
	outFd := stdoutFd. 
	errFd := stderrFd.
	"self watch: [ :status | self close ]"
]

{ #category : 'private - factory' }
GIOPipedProcess >> newChannel: fd [

	^ GIOChannel newFromFileDescriptor: fd
]

{ #category : 'accessing' }
GIOPipedProcess >> outChannel [

	^ outChannel ifNil: [ outChannel := self newChannel: outFd ]
]
