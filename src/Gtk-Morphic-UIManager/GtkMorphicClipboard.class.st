Class {
	#name : 'GtkMorphicClipboard',
	#superclass : 'Clipboard',
	#category : 'Gtk-Morphic-UIManager',
	#package : 'Gtk-Morphic-UIManager'
}

{ #category : 'private' }
GtkMorphicClipboard >> beDefault [

	Default := self
]

{ #category : 'accessing' }
GtkMorphicClipboard >> clipboard [

	^ GdkDisplay default primaryClipboard
]

{ #category : 'accessing' }
GtkMorphicClipboard >> clipboardText [

	^ self clipboard readText withInternalLineEndings
]

{ #category : 'accessing' }
GtkMorphicClipboard >> clipboardText: aString [

	self clipboard text: (aString asString withLineEndings: OSPlatform current lineEnding)
]
