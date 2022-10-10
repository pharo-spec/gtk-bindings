"
I'm a container with just one child.

https://developer.gnome.org/gtk3/stable/GtkBin.html
"
Class {
	#name : #GtkBin,
	#superclass : #GtkContainer,
	#instVars : [
		'child'
	],
	#pools : [
		'GtkOrientation'
	],
	#category : #'Gtk-Widget-Container'
}

{ #category : #accessing }
GtkBin class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_bin_get_type())
]

{ #category : #'instance creation' }
GtkBin class >> newWidget: aWidget [
	^ self new 
		child: aWidget;
		yourself
]

{ #category : #accessing }
GtkBin >> add: aWidget [

	self 
		deprecated: 'Use #child: instead.' 
		transformWith: '`@receiver add: `@arg1' -> '`@receiver child: `@arg1'.

	child ifNotNil: [ 
		GtkError signal: 'Bin container already contains a widget!' ].
	^ self child: aWidget
]

{ #category : #accessing }
GtkBin >> child [
	^ self children anyOne
]

{ #category : #accessing }
GtkBin >> child: aWidget [

	child := aWidget.
	self setChild: aWidget
]

{ #category : #accessing }
GtkBin >> removeChild [

	self remove: self child
]

{ #category : #private }
GtkBin >> setChild: aWidget [

	^ self subclassResponsibility
]
