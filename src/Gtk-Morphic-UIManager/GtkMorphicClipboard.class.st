Class {
	#name : #GtkMorphicClipboard,
	#superclass : #Clipboard,
	#category : #'Gtk-Morphic-UIManager'
}

{ #category : #private }
GtkMorphicClipboard >> beDefault [

	Default := self
]

{ #category : #accessing }
GtkMorphicClipboard >> clipboardText [

	^ GtkClipboard forSelection waitForText withInternalLineEndings
]

{ #category : #accessing }
GtkMorphicClipboard >> clipboardText: aString [

	GtkClipboard forSelection text: (aString asString withLineEndings: OSPlatform current lineEnding)
]
