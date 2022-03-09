Class {
	#name : #GDummyEngine,
	#superclass : #GEngine,
	#category : #'GObject-Base'
}

{ #category : #'system startup' }
GDummyEngine >> ensureRunLoop [

	"Nothing to do I am Dummy"
]

{ #category : #accessing }
GDummyEngine >> naturalRunner [

	"In the DummyRunner I use the default Runner"
	^ TFSameThreadRunner uniqueInstance
]
