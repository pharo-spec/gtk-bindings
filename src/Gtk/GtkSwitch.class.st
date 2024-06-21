"
GtkSwitch
GtkSwitch — A “light switch” style toggle

https://developer.gnome.org/gtk3/unstable/GtkSwitch.html
"
Class {
	#name : 'GtkSwitch',
	#superclass : 'GtkWidget',
	#traits : 'GtkTToggleableButton',
	#classTraits : 'GtkTToggleableButton classTrait',
	#category : 'Gtk-Widget-Buttons',
	#package : 'Gtk',
	#tag : 'Widget-Buttons'
}

{ #category : 'private' }
GtkSwitch class >> buttonNew [

	^ self ffiCall: #(GtkSwitch *gtk_switch_new (void))
]

{ #category : 'accessing' }
GtkSwitch class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_switch_get_type())
]

{ #category : 'instance creation' }
GtkSwitch class >> new [ 
	^ self buttonNew initialize
]

{ #category : 'instance creation' }
GtkSwitch class >> off [

	^ self new
		beNonActive;
		yourself
]

{ #category : 'instance creation' }
GtkSwitch class >> on [

	^ self new
		beActive;
		yourself
]

{ #category : 'accessing' }
GtkSwitch >> active: aBoolean [

	^ self ffiCall: #(void gtk_switch_set_active (self, gboolean aBoolean))
]

{ #category : 'signaling' }
GtkSwitch >> connectStateSet: aBlock [

	^ self 
		connect: 'state-set' 
		signature: #(gboolean (void *widget, gboolean state, void *aData))  
 		do: [ :widget :state :aData | aBlock value ] 
]

{ #category : 'accessing' }
GtkSwitch >> isActive [

	^ self ffiCall: #(gboolean gtk_switch_get_active (self))
]
