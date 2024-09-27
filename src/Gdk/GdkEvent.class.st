"
union GdkEvent

A GdkEvent contains a union of all of the event types, and allows access to the data fields in a number of ways.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEvent
"
Class {
	#name : 'GdkEvent',
	#superclass : 'GBaseObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#instVars : [
		'#wasHandled',
		'#type',
		'#position',
		'#positionWidget => WeakSlot'
	],
	#pools : [
		'GdkEventType'
	],
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'private' }
GdkEvent class >> classForType: type [

	^ self allSubclasses
		detect: [ :each | each isType: type ]
		ifFound: [ :each | each ]
		ifNone: [ GdkEvent ]
]

{ #category : 'private' }
GdkEvent class >> eventNew: type [

	self deprecated: #Gtk4
]

{ #category : 'finalization' }
GdkEvent class >> finalizeResourceData: aHandle [

	self unref: aHandle
]

{ #category : 'accessing' }
GdkEvent class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_event_get_type())
]

{ #category : 'private' }
GdkEvent class >> getType: handle [

	^ self ffiCall: #(GdkEventType gdk_event_get_event_type (void *handle))
]

{ #category : 'testing' }
GdkEvent class >> isType: aType [

	^ false
]

{ #category : 'instance creation' }
GdkEvent class >> newConcreteFromHandle: handle [
	| type |
	
	type := self getType: handle.
	^ (self classForType: type) fromHandle: handle
]

{ #category : 'instance creation' }
GdkEvent class >> newType: aType [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GdkEvent class >> unref: handle [

	self ffiCall: #(void gdk_event_unref ("GdkEvent *"void *handle))
]

{ #category : 'visiting' }
GdkEvent >> accept: aVisitor [
	
	^ aVisitor visitUnknownEvent: self
]

{ #category : 'converting' }
GdkEvent >> asConcreteType [

	^ self class newConcreteFromHandle: self getHandle
]

{ #category : 'compatibility' }
GdkEvent >> button [
	"button number pressed. 
	 by default, zero"

	^ 0
]

{ #category : 'private' }
GdkEvent >> calculatePosition [
	"Since position in Gtk4 is relative to the surface (the window) and not in the widget
	 subscribed the event, we need to calculate it. But we do it lazily because position
	 is not always used, so there is no point on do the work until is demanded."

	^ positionWidget
		ifNotNil: [ self calculatePositionRelativeTo: positionWidget ]
		ifNil: [ self getPosition ]
]

{ #category : 'private' }
GdkEvent >> calculatePositionRelativeTo: aWidget [
	| root |

	root := aWidget root.
	^ root
		translateCoordinates: (self getPosition - root surfaceTransform)
		to: aWidget
]

{ #category : 'accessing' }
GdkEvent >> device [

	^ self ffiCall: #(GdkDevice *gdk_event_get_device (self))
]

{ #category : 'accessing' }
GdkEvent >> display [

	^ self ffiCall: #(GdkDisplay *gdk_event_get_display (self))
]

{ #category : 'accessing' }
GdkEvent >> ffiLibrary [

	^ GdkLibrary
]

{ #category : 'private' }
GdkEvent >> getPosition [
	| x y |

	x := FFIFloat64 newBuffer.
	y := FFIFloat64 newBuffer.
	self getPositionX: x y: y.

	^ (x doubleAt: 1) asInteger@(y doubleAt: 1) asInteger
]

{ #category : 'private' }
GdkEvent >> getPositionX: x y: y [ 

	^ self ffiCall: #(gboolean gdk_event_get_position (self, double* x, double* y))
]

{ #category : 'private' }
GdkEvent >> getType [ 

	^ self ffiCall: #(GdkEventType gdk_event_get_event_type (self))
]

{ #category : 'initialization' }
GdkEvent >> initialize [

	self class initializeSlots: self.
	super initialize
]

{ #category : 'testing' }
GdkEvent >> isAnyType [

	^ self class = GdkEvent
]

{ #category : 'testing' }
GdkEvent >> isButtonEvent [

	^ false
]

{ #category : 'testing' }
GdkEvent >> isCrossingEvent [

	^ false
]

{ #category : 'testing' }
GdkEvent >> isDoubleClick [

	^ false
]

{ #category : 'testing' }
GdkEvent >> isKeyEvent [

	^ false
]

{ #category : 'testing' }
GdkEvent >> isMotionEvent [

	^ false
]

{ #category : 'testing' }
GdkEvent >> isPointerEmulated [

	self ffiCall: #(gboolean gdk_event_get_pointer_emulated (self))

]

{ #category : 'accessing' }
GdkEvent >> modifierState [

	^ self ffiCall: #(GdkModifierType gdk_event_get_modifier_state (self))
]

{ #category : 'accessing' }
GdkEvent >> position [

	^ position ifNil: [ position := self calculatePosition ]
]

{ #category : 'accessing' }
GdkEvent >> ref [

	self ffiCall: #(void gdk_event_ref (self))
]

{ #category : 'accessing' }
GdkEvent >> seat [

	^ self ffiCall: #(GdkSeat* gdk_event_get_seat (self))
]

{ #category : 'accessing' }
GdkEvent >> surface [

	^ self ffiCall: #(GdkSurface* gdk_event_get_surface (self))
]

{ #category : 'accessing' }
GdkEvent >> time [

	^ self ffiCall: #(guint32 gdk_event_get_time (self))
]

{ #category : 'testing' }
GdkEvent >> triggersContextMenu [

	^ self ffiCall: #(gboolean gdk_event_triggers_context_menu (self))
]

{ #category : 'accessing' }
GdkEvent >> type [

	^ type ifNil: [ type := self getType ]
]

{ #category : 'accessing' }
GdkEvent >> unref [

	self ffiCall: #(void gdk_event_unref (self))
]

{ #category : 'compatibility' }
GdkEvent >> wasHandled [
	"this should be in package Gtk-Morphic but I need the instance variable"

	^ wasHandled ifNil: [ wasHandled := false ]
]

{ #category : 'compatibility' }
GdkEvent >> wasHandled: aBoolean [

	^ wasHandled := aBoolean
]

{ #category : 'accessing' }
GdkEvent >> withPositionRelativeTo: aWidget [

	positionWidget := aWidget.
	position := nil
]
