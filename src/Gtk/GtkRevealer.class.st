"
GtkRevealer — Hide and show with animation

https://docs.gtk.org/gtk4/class.Revealer.html
"
Class {
	#name : 'GtkRevealer',
	#superclass : 'GtkWidget',
	#traits : 'GtkTBin',
	#classTraits : 'GtkTBin classTrait',
	#pools : [
		'GtkRevealerTransitionType'
	],
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'accessing' }
GtkRevealer class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_revealer_get_type())
]

{ #category : 'instance creation' }
GtkRevealer class >> new [

	^ self revealerNew initialize
]

{ #category : 'instance creation' }
GtkRevealer class >> newWithChild: aChild [

	^ self new
		add: aChild;
		yourself
]

{ #category : 'private' }
GtkRevealer class >> revealerNew [

	^ self ffiCall: #(GtkRevealer *gtk_revealer_new (void))
]

{ #category : 'accessing' }
GtkRevealer >> hideChild [

	^ self revealChild: false
]

{ #category : 'accessing' }
GtkRevealer >> isChildBeingRevealed [

	^ self ffiCall: #(gboolean gtk_revealer_get_reveal_child (self))
]

{ #category : 'accessing' }
GtkRevealer >> isChildRevealed [

	^ self ffiCall: #(gboolean gtk_revealer_get_child_revealed (self))
]

{ #category : 'accessing' }
GtkRevealer >> revealChild [

	^ self revealChild: true
]

{ #category : 'accessing' }
GtkRevealer >> revealChild: aBoolean [

	^ self ffiCall: #(void gtk_revealer_set_reveal_child (self, gboolean aBoolean))
]

{ #category : 'private' }
GtkRevealer >> setChild: aWidget [

	^ self ffiCall: #(void gtk_revealer_set_child (self, GtkWidget* child))
]

{ #category : 'accessing' }
GtkRevealer >> setCrossfadeTransition [

	self transitionType: GTK_REVEALER_TRANSITION_TYPE_CROSSFADE
]

{ #category : 'accessing' }
GtkRevealer >> setNoTransition [

	self transitionType: GTK_REVEALER_TRANSITION_TYPE_NONE
]

{ #category : 'accessing' }
GtkRevealer >> setSlideDownTransition [

	self transitionType: GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN
]

{ #category : 'accessing' }
GtkRevealer >> setSlideLeftTransition [

	self transitionType: GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT
]

{ #category : 'accessing' }
GtkRevealer >> setSlideRightTransition [

	self transitionType: GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT
]

{ #category : 'accessing' }
GtkRevealer >> setSlideUpTransition [

	self transitionType: GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP
]

{ #category : 'accessing' }
GtkRevealer >> transitionDuration [

	^ Duration milliSeconds: self transitionDurationMilliseconds
]

{ #category : 'accessing' }
GtkRevealer >> transitionDuration: aDuration [

	^ self transitionDurationMilliseconds: aDuration asMilliSeconds
]

{ #category : 'accessing' }
GtkRevealer >> transitionDurationMilliseconds [

	^ self ffiCall: #(guint gtk_revealer_get_transition_duration (self))
]

{ #category : 'accessing' }
GtkRevealer >> transitionDurationMilliseconds: duration [

	^ self ffiCall: #(void gtk_revealer_set_transition_duration (self, guint duration))
]

{ #category : 'accessing' }
GtkRevealer >> transitionType [

	^ self ffiCall: #(GtkRevealerTransitionType gtk_revealer_get_transition_type (self))
]

{ #category : 'accessing' }
GtkRevealer >> transitionType: transition [

	^ self ffiCall: #(void gtk_revealer_set_transition_type (self, GtkRevealerTransitionType transition))
]
