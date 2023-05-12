Class {
	#name : #GtkImageFromMorphExample,
	#superclass : #Object,
	#category : #'Gtk-Tests-Examples'
}

{ #category : #'instance creation' }
GtkImageFromMorphExample class >> open [
	<script>

	^ self new open
]

{ #category : #private }
GtkImageFromMorphExample >> addContentsTo: window [
	| widget morph image |

	widget := GtkBox newVertical.
	widget expand: true.

	morph :=  (self currentWorld submorphs 
		detect: [ :each | each class = ImageMorph ]).
	image :=  morph asGtkImage.
	image expand: true.
	widget append: image.
	
	window child: widget
]

{ #category : #opening }
GtkImageFromMorphExample >> open [
	| window |
	
	GEngine ensureRunning.
	GRunLoop defer: [ 
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example image from morph '.
		self addContentsTo: window.
		window present ]

	
]
