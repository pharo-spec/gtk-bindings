Class {
	#name : #GdkClipboardTest,
	#superclass : #TestCase,
	#category : #'Gtk-Tests-Base'
}

{ #category : #tests }
GdkClipboardTest >> testText [
	| clipboard result |

	GEngine ensureRunning.
	clipboard := GRunLoop defer: [ GdkClipboard primary ].
	GRunLoop defer: [ clipboard text: 'TEST' ].
	result := GRunLoop defer: [ clipboard readText ].

	self assert: result equals: 'TEST'
]
