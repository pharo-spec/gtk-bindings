"
An event related to a scrolling motion.

https://docs.gtk.org/gdk4/class.ScrollEvent.html
"
Class {
	#name : 'GdkScrollEvent',
	#superclass : 'GdkEvent',
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkScrollEvent class >> isType: aType [

	^ aType = GDK_SCROLL
]

{ #category : 'visiting' }
GdkScrollEvent >> accept: aVisitor [

	^ aVisitor visitScrollEvent: self
]

{ #category : 'accessing' }
GdkScrollEvent >> deltas [
	| x y |
	
	x := FFIFloat64 newBuffer. 
	y := FFIFloat64 newBuffer.	
	self getDeltaX: x y: y.
	
	^ (x doubleAt: 1)@(y doubleAt: 1)
]

{ #category : 'accessing' }
GdkScrollEvent >> direction [

	^ self ffiCall: #(GdkScrollDirection gdk_scroll_event_get_direction (self))
]

{ #category : 'private' }
GdkScrollEvent >> getDeltaX: delta_x y: delta_y [

	self ffiCall: #(void gdk_scroll_event_get_deltas (self, double* delta_x, double* delta_y))
]

{ #category : 'testing' }
GdkScrollEvent >> isStop [

	^ self ffiCall: #(gboolean gdk_scroll_event_is_stop (self))
]

{ #category : 'compatibility' }
GdkScrollEvent >> state [

	^ self ffiCall: #(GdkModifierType gdk_event_get_modifier_state (self))
]

{ #category : 'accessing' }
GdkScrollEvent >> unit [

	^ self ffiCall: #(GdkScrollUnit gdk_scroll_event_get_unit (self))
]
