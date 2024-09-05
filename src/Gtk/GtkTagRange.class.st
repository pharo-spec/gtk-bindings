"
An util to answer tags of a text buffer, with its range of application (this is used in `GtkTextBuffer>>#tagsWithRange)
"
Class {
	#name : 'GtkTagRange',
	#superclass : 'Object',
	#instVars : [
		'tag',
		'start',
		'end'
	],
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'instance creation' }
GtkTagRange class >> newTag: aTag [

	^ self new tag: aTag
]

{ #category : 'accessing' }
GtkTagRange >> end [

	^ end
]

{ #category : 'testing' }
GtkTagRange >> isSameTag: aTag [

	^ tag getHandle asInteger = aTag getHandle asInteger
]

{ #category : 'printing' }
GtkTagRange >> printOn: stream [

	super printOn: stream.
	stream << '('; print: self start.
	stream << ' to '; print: self end.
	stream << ')'
]

{ #category : 'accessing' }
GtkTagRange >> start [

	^ start
]

{ #category : 'accessing' }
GtkTagRange >> tag [

	^ tag
]

{ #category : 'accessing' }
GtkTagRange >> tag: aTag [

	tag := aTag
]

{ #category : 'updating' }
GtkTagRange >> updatePosition: aNumber [

	start ifNil: [ start := aNumber ].
	end := aNumber
]
