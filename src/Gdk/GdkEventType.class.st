"
Specifies the type of the event.

https://docs.gtk.org/gdk4/enum.EventType.html
"
Class {
	#name : 'GdkEventType',
	#superclass : 'GEnumeration',
	#classVars : [
		'GDK_BUTTON_PRESS',
		'GDK_BUTTON_RELEASE',
		'GDK_DELETE',
		'GDK_DRAG_ENTER',
		'GDK_DRAG_LEAVE',
		'GDK_DRAG_MOTION',
		'GDK_DROP_START',
		'GDK_ENTER_NOTIFY',
		'GDK_FOCUS_CHANGE',
		'GDK_GRAB_BROKEN',
		'GDK_KEY_PRESS',
		'GDK_KEY_RELEASE',
		'GDK_LEAVE_NOTIFY',
		'GDK_MOTION_NOTIFY',
		'GDK_PAD_BUTTON_PRESS',
		'GDK_PAD_BUTTON_RELEASE',
		'GDK_PAD_GROUP_MODE',
		'GDK_PAD_RING',
		'GDK_PAD_STRIP',
		'GDK_PROXIMITY_IN',
		'GDK_PROXIMITY_OUT',
		'GDK_SCROLL',
		'GDK_TOUCHPAD_HOLD',
		'GDK_TOUCHPAD_PINCH',
		'GDK_TOUCHPAD_SWIPE',
		'GDK_TOUCH_BEGIN',
		'GDK_TOUCH_CANCEL',
		'GDK_TOUCH_END',
		'GDK_TOUCH_UPDATE'
	],
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'accessing enum' }
GdkEventType class >> GDK_BUTTON_PRESS [
	"This method was automatically generated"
	^ GDK_BUTTON_PRESS
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_BUTTON_RELEASE [
	"This method was automatically generated"
	^ GDK_BUTTON_RELEASE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_DELETE [
	"This method was automatically generated"
	^ GDK_DELETE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_DRAG_ENTER [
	"This method was automatically generated"
	^ GDK_DRAG_ENTER
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_DRAG_LEAVE [
	"This method was automatically generated"
	^ GDK_DRAG_LEAVE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_DRAG_MOTION [
	"This method was automatically generated"
	^ GDK_DRAG_MOTION
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_DROP_START [
	"This method was automatically generated"
	^ GDK_DROP_START
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_ENTER_NOTIFY [
	"This method was automatically generated"
	^ GDK_ENTER_NOTIFY
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_FOCUS_CHANGE [
	"This method was automatically generated"
	^ GDK_FOCUS_CHANGE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_GRAB_BROKEN [
	"This method was automatically generated"
	^ GDK_GRAB_BROKEN
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_KEY_PRESS [
	"This method was automatically generated"
	^ GDK_KEY_PRESS
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_KEY_RELEASE [
	"This method was automatically generated"
	^ GDK_KEY_RELEASE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_LEAVE_NOTIFY [
	"This method was automatically generated"
	^ GDK_LEAVE_NOTIFY
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_MOTION_NOTIFY [
	"This method was automatically generated"
	^ GDK_MOTION_NOTIFY
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_PAD_BUTTON_PRESS [
	"This method was automatically generated"
	^ GDK_PAD_BUTTON_PRESS
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_PAD_BUTTON_RELEASE [
	"This method was automatically generated"
	^ GDK_PAD_BUTTON_RELEASE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_PAD_GROUP_MODE [
	"This method was automatically generated"
	^ GDK_PAD_GROUP_MODE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_PAD_RING [
	"This method was automatically generated"
	^ GDK_PAD_RING
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_PAD_STRIP [
	"This method was automatically generated"
	^ GDK_PAD_STRIP
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_PROXIMITY_IN [
	"This method was automatically generated"
	^ GDK_PROXIMITY_IN
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_PROXIMITY_OUT [
	"This method was automatically generated"
	^ GDK_PROXIMITY_OUT
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_SCROLL [
	"This method was automatically generated"
	^ GDK_SCROLL
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_TOUCHPAD_HOLD [
	"This method was automatically generated"
	^ GDK_TOUCHPAD_HOLD
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_TOUCHPAD_PINCH [
	"This method was automatically generated"
	^ GDK_TOUCHPAD_PINCH
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_TOUCHPAD_SWIPE [
	"This method was automatically generated"
	^ GDK_TOUCHPAD_SWIPE
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_TOUCH_BEGIN [
	"This method was automatically generated"
	^ GDK_TOUCH_BEGIN
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_TOUCH_CANCEL [
	"This method was automatically generated"
	^ GDK_TOUCH_CANCEL
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_TOUCH_END [
	"This method was automatically generated"
	^ GDK_TOUCH_END
]

{ #category : 'accessing enum' }
GdkEventType class >> GDK_TOUCH_UPDATE [
	"This method was automatically generated"
	^ GDK_TOUCH_UPDATE
]

{ #category : 'enum declaration' }
GdkEventType class >> enumDecl [
	"
	self rebuildEnumAccessors.
	self initializeEnumeration."
	
	^ #(
  GDK_DELETE 						0
  GDK_MOTION_NOTIFY 				1
  GDK_BUTTON_PRESS 				2
  GDK_BUTTON_RELEASE 				3
  GDK_KEY_PRESS 					4
  GDK_KEY_RELEASE 					5
  GDK_ENTER_NOTIFY 				6
  GDK_LEAVE_NOTIFY 				7
  GDK_FOCUS_CHANGE 				8
  GDK_PROXIMITY_IN 				9
  GDK_PROXIMITY_OUT 				10
  GDK_DRAG_ENTER 					11
  GDK_DRAG_LEAVE 					12
  GDK_DRAG_MOTION 					13
  GDK_DROP_START 					14
  GDK_SCROLL 						15
  GDK_GRAB_BROKEN 					16
  GDK_TOUCH_BEGIN 					17
  GDK_TOUCH_UPDATE 				18
  GDK_TOUCH_END 					19
  GDK_TOUCH_CANCEL 				20
  GDK_TOUCHPAD_SWIPE 				21
  GDK_TOUCHPAD_PINCH 				22
  GDK_PAD_BUTTON_PRESS 			23
  GDK_PAD_BUTTON_RELEASE 		24
  GDK_PAD_RING 						25
  GDK_PAD_STRIP 					26 
  GDK_PAD_GROUP_MODE 				27
  GDK_TOUCHPAD_HOLD 				28
)
]
