"
GtkGestureClick is a GtkGesture implementation for clicks.

https://docs.gtk.org/gtk4/class.GestureClick.html
"
Class {
	#name : #GtkGestureClick,
	#superclass : #GtkGestureSingle,
	#category : #'Gtk-Event-Controllers'
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

	(GButtonPressedCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkGestureClick >> connectReleased: aBlock [
	"aBlock arguments: 
		- position (a Point)
		- n_press"

	(GButtonReleasedCallback do: aBlock) connectTo: self
]

{ #category : #testing }
GtkGestureClick >> isGestureClick [

	^ true
]
