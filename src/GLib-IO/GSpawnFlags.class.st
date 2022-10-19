"
enum GSpawnFlags

Flags passed to g_spawn_sync(), g_spawn_async() and g_spawn_async_with_pipes().
"
Class {
	#name : #GSpawnFlags,
	#superclass : #GEnumeration,
	#classVars : [
		'G_SPAWN_CHILD_INHERITS_STDERR',
		'G_SPAWN_CHILD_INHERITS_STDIN',
		'G_SPAWN_CHILD_INHERITS_STDOUT',
		'G_SPAWN_CLOEXEC_PIPES',
		'G_SPAWN_DEFAULT',
		'G_SPAWN_DO_NOT_REAP_CHILD',
		'G_SPAWN_FILE_AND_ARGV_ZERO',
		'G_SPAWN_LEAVE_DESCRIPTORS_OPEN',
		'G_SPAWN_SEARCH_PATH',
		'G_SPAWN_SEARCH_PATH_FROM_ENVP',
		'G_SPAWN_STDERR_TO_DEV_NULL',
		'G_SPAWN_STDIN_FROM_DEV_NULL',
		'G_SPAWN_STDOUT_TO_DEV_NULL'
	],
	#category : #'GLib-IO'
}

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_CHILD_INHERITS_STDERR [
	"This method was automatically generated"
	^ G_SPAWN_CHILD_INHERITS_STDERR
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_CHILD_INHERITS_STDIN [
	"This method was automatically generated"
	^ G_SPAWN_CHILD_INHERITS_STDIN
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_CHILD_INHERITS_STDOUT [
	"This method was automatically generated"
	^ G_SPAWN_CHILD_INHERITS_STDOUT
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_CLOEXEC_PIPES [
	"This method was automatically generated"
	^ G_SPAWN_CLOEXEC_PIPES
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_DEFAULT [
	"This method was automatically generated"
	^ G_SPAWN_DEFAULT
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_DO_NOT_REAP_CHILD [
	"This method was automatically generated"
	^ G_SPAWN_DO_NOT_REAP_CHILD
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_FILE_AND_ARGV_ZERO [
	"This method was automatically generated"
	^ G_SPAWN_FILE_AND_ARGV_ZERO
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_LEAVE_DESCRIPTORS_OPEN [
	"This method was automatically generated"
	^ G_SPAWN_LEAVE_DESCRIPTORS_OPEN
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_SEARCH_PATH [
	"This method was automatically generated"
	^ G_SPAWN_SEARCH_PATH
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_SEARCH_PATH_FROM_ENVP [
	"This method was automatically generated"
	^ G_SPAWN_SEARCH_PATH_FROM_ENVP
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_STDERR_TO_DEV_NULL [
	"This method was automatically generated"
	^ G_SPAWN_STDERR_TO_DEV_NULL
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_STDIN_FROM_DEV_NULL [
	"This method was automatically generated"
	^ G_SPAWN_STDIN_FROM_DEV_NULL
]

{ #category : #'accessing enum' }
GSpawnFlags class >> G_SPAWN_STDOUT_TO_DEV_NULL [
	"This method was automatically generated"
	^ G_SPAWN_STDOUT_TO_DEV_NULL
]

{ #category : #'enum declaration' }
GSpawnFlags class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors 
	"

	^ { 
		#G_SPAWN_DEFAULT                . 0.
		#G_SPAWN_LEAVE_DESCRIPTORS_OPEN . 1 << 0.
		#G_SPAWN_DO_NOT_REAP_CHILD      . 1 << 1.
		"/* look for argv[0] in the path i.e. use execvp() */"
		#G_SPAWN_SEARCH_PATH            . 1 << 2.
		"/* Dump output to /dev/null */"
		#G_SPAWN_STDOUT_TO_DEV_NULL     . 1 << 3.
		#G_SPAWN_STDERR_TO_DEV_NULL     . 1 << 4.
		#G_SPAWN_CHILD_INHERITS_STDIN   . 1 << 5.
		#G_SPAWN_FILE_AND_ARGV_ZERO     . 1 << 6.
		#G_SPAWN_SEARCH_PATH_FROM_ENVP  . 1 << 7.
		#G_SPAWN_CLOEXEC_PIPES          . 1 << 8.
		#G_SPAWN_CHILD_INHERITS_STDOUT  . 1 << 9.
		#G_SPAWN_CHILD_INHERITS_STDERR  . 1 << 10.
		#G_SPAWN_STDIN_FROM_DEV_NULL    . 1 << 11
	 }
]
