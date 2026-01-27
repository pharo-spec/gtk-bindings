Class {
	#name : 'GtkSourceStyle',
	#superclass : 'GObject',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'tag'
	],
	#category : 'GtkSourceView-Base',
	#package : 'GtkSourceView',
	#tag : 'Base'
}

{ #category : 'accessing' }
GtkSourceStyle class >> gType [

	^ self ffiCall: #(gsize gtk_source_style_get_type()) module: GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceStyle class >> gtkNew [

	^ self fromHandleUnreferenced: (self gObjectNew: self gType)
]

{ #category : 'instance creation' }
GtkSourceStyle class >> new [

	^ self gtkNew initialize
]

{ #category : 'accessing' }
GtkSourceStyle >> apply: aTag [ 

	tag := aTag.
	self basicApply: tag
]

{ #category : 'private' }
GtkSourceStyle >> basicApply: tag [

	self ffiCall: #(void gtk_source_style_apply (self, GtkTextTag* tag))
]
