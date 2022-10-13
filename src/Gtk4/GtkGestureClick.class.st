Class {
	#name : #GtkGestureClick,
	#superclass : #GtkGestureSingle,
	#category : #'Gtk4-List'
}

{ #category : #private }
GtkGestureClick class >> gtkNew [

	^ self ffiCall: #(GtkGestureClick* gtk_gesture_click_new (void))
]

{ #category : #'instance creation' }
GtkGestureClick class >> new [

	^ self gtkNew initialize
]

{ #category : #'as yet unclassified' }
GtkGestureClick >> connectPressed: aBlock [
	"aBlock arguments: 
		- position (a Point)
		- n_press"

	(GPressedCallback do: aBlock) connectTo: self
]
