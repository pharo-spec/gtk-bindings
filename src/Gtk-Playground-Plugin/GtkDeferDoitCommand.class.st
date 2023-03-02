Class {
	#name : #GtkDeferDoitCommand,
	#superclass : #StPlaygroundMenuExtensionCommand,
	#category : #'Gtk-Playground-Plugin'
}

{ #category : #'accessing - defaults' }
GtkDeferDoitCommand class >> defaultDescription [

	^ 'Executes the selected string in the Gtk run loop'
]

{ #category : #initialization }
GtkDeferDoitCommand class >> defaultIconName [

	^ #smallDoIt
]

{ #category : #'accessing - defaults' }
GtkDeferDoitCommand class >> defaultName [

	^ 'Defer'
]

{ #category : #default }
GtkDeferDoitCommand class >> defaultShortcutKey [

	^ $d alt
]

{ #category : #executing }
GtkDeferDoitCommand >> execute [
	| doit |

	doit := self context selectedTextOrLine.
	doit ifEmpty: [
		self inform: 'Nothing to defer'.
		^ self ].

	self context text
		evaluate: (String streamContents: [  :stream |
			stream << 'GEngine ensureRunning.'; cr.
			stream << 'GRunLoop defer: [ '  <<  doit << ' ] ' ])
		onCompileError: [ ^ self ]
		onError: [ :e | e pass ]
]
