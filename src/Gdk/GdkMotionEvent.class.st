"
struct GdkEventMotion

Generated when the pointer moves.
"
Class {
	#name : #GdkMotionEvent,
	#superclass : #GdkEvent,
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#category : #'Gdk-Events'
}

{ #category : #'field definition' }
GdkMotionEvent class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
  GdkEventType type;
  "GdkWindow *"void *window;
  gint8 send_event;
  guint32 time;
  gdouble x;
  gdouble y;
  gdouble *axes;
  guint state;
  gint16 is_hint;
  "GdkDevice *"void *device;
  gdouble x_root;
  gdouble y_root; 
	)
]

{ #category : #testing }
GdkMotionEvent class >> isType: aType [

	^ aType = GDK_MOTION_NOTIFY
]

{ #category : #visiting }
GdkMotionEvent >> accept: aVisitor [

	^ aVisitor visitMouseMoveEvent: self
]

{ #category : #testing }
GdkMotionEvent >> isMotionEvent [

	^ true
]

{ #category : #compatibility }
GdkMotionEvent >> state [
	
	^ self modifierState
]
