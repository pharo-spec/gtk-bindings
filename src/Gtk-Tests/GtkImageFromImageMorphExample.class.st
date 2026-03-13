Class {
	#name : 'GtkImageFromImageMorphExample',
	#superclass : 'Object',
	#category : 'Gtk-Tests-Examples',
	#package : 'Gtk-Tests',
	#tag : 'Examples'
}

{ #category : 'instance creation' }
GtkImageFromImageMorphExample class >> open [
	<script>

	^ self new open
]

{ #category : 'private' }
GtkImageFromImageMorphExample >> addContentsTo: window [
	| morph image |

	morph :=  (self currentWorld submorphs 
		detect: [ :each | each class = ImageMorph ]).
	image :=  morph asGtkImage.
	image expand: true.
	
	window child: image
]

{ #category : 'opening' }
GtkImageFromImageMorphExample >> open [
	<script: 'self new open'>
	| window |
	
	GEngine ensureRunning.
	GRunLoop defer: [ 
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example image from morph '.
		self addContentsTo: window.
		window present ]

	
]
