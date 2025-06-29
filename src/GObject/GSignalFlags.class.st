Class {
	#name : 'GSignalFlags',
	#superclass : 'GEnumeration',
	#classVars : [
		'G_SIGNAL_ACTION',
		'G_SIGNAL_DEPRECATED',
		'G_SIGNAL_DETAILED',
		'G_SIGNAL_MUST_COLLECT',
		'G_SIGNAL_NO_HOOKS',
		'G_SIGNAL_NO_RECURSE',
		'G_SIGNAL_RUN_CLEANUP',
		'G_SIGNAL_RUN_FIRST',
		'G_SIGNAL_RUN_LAST'
	],
	#category : 'GObject-ClassBuilder',
	#package : 'GObject',
	#tag : 'ClassBuilder'
}

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_ACTION [
	"This method was automatically generated"
	^ G_SIGNAL_ACTION
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_DEPRECATED [
	"This method was automatically generated"
	^ G_SIGNAL_DEPRECATED
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_DETAILED [
	"This method was automatically generated"
	^ G_SIGNAL_DETAILED
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_MUST_COLLECT [
	"This method was automatically generated"
	^ G_SIGNAL_MUST_COLLECT
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_NO_HOOKS [
	"This method was automatically generated"
	^ G_SIGNAL_NO_HOOKS
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_NO_RECURSE [
	"This method was automatically generated"
	^ G_SIGNAL_NO_RECURSE
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_RUN_CLEANUP [
	"This method was automatically generated"
	^ G_SIGNAL_RUN_CLEANUP
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_RUN_FIRST [
	"This method was automatically generated"
	^ G_SIGNAL_RUN_FIRST
]

{ #category : 'accessing enum' }
GSignalFlags class >> G_SIGNAL_RUN_LAST [
	"This method was automatically generated"
	^ G_SIGNAL_RUN_LAST
]

{ #category : 'enum declaration' }
GSignalFlags class >> enumDecl [
	"
	self rebuildEnumAccessors
	"
	^ {
	#G_SIGNAL_RUN_FIRST       . 1 << 0.
  	#G_SIGNAL_RUN_LAST        . 1 << 1.
  	#G_SIGNAL_RUN_CLEANUP     . 1 << 2.
  	#G_SIGNAL_NO_RECURSE      . 1 << 3.
  	#G_SIGNAL_DETAILED        . 1 << 4.
  	#G_SIGNAL_ACTION          . 1 << 5.
  	#G_SIGNAL_NO_HOOKS        . 1 << 6.
  	#G_SIGNAL_MUST_COLLECT    . 1 << 7.
  	#G_SIGNAL_DEPRECATED      . 1 << 8.
	}
]
