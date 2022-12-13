"
GtkGestureClick is a GtkGesture implementation for clicks.

https://docs.gtk.org/gtk4/class.GestureClick.html
"
Class {
	#name : #GtkGestureClick,
	#superclass : #GtkGestureSingle,
	#category : #'Gtk4-Event-Controllers'
}

{ #category : #private }
GtkGestureClick class >> gtkNew [

	^ self ffiCall: #(GtkGestureClick* gtk_gesture_click_new (void))
]

{ #category : #signaling }
GtkGestureClick >> connectPressed: aBlock [
	"aBlock arguments: 
		- position (a Point)
		- n_press"

	(GPressedCallback do: aBlock) connectTo: self
]

{ #category : #testing }
GtkGestureClick >> isClickGesture [

	^ true
]
