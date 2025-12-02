"
GtkToggleButton — Create buttons which retain their state

https://docs.gtk.org/gtk4/class.ToggleButton.html
"
Class {
	#name : 'GtkToggleButton',
	#superclass : 'GtkButton',
	#traits : 'GtkTToggleableButton',
	#classTraits : 'GtkTToggleableButton classTrait',
	#category : 'Gtk-Widget-Buttons',
	#package : 'Gtk',
	#tag : 'Widget-Buttons'
}

{ #category : 'private' }
GtkToggleButton class >> buttonNew [
	^ self ffiCall: #(GtkToggleButton *gtk_toggle_button_new ())
]

{ #category : 'private' }
GtkToggleButton class >> buttonNewWithLabel: utf8EncodedString [

	^ self ffiCall: #(GtkToggleButton *gtk_toggle_button_new_with_label (String utf8EncodedString))
]

{ #category : 'accessing' }
GtkToggleButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_toggle_button_get_type())
]

{ #category : 'private' }
GtkToggleButton >> active: aBoolean [

	^ self ffiCall: #(void gtk_toggle_button_set_active (self, gboolean aBoolean))
]

{ #category : 'accessing' }
GtkToggleButton >> doNotDrawIndicator [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkToggleButton >> drawIndicator [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkToggleButton >> drawIndicator: aBoolean [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkToggleButton >> groupTo: group [

	self ffiCall: #(void gtk_toggle_button_set_group (self, GtkToggleButton* group))
]

{ #category : 'accessing' }
GtkToggleButton >> inconsistent: aBoolean [

	self deprecated: #Gtk4
]

{ #category : 'testing' }
GtkToggleButton >> isActive [

	^ self ffiCall: #(gboolean gtk_toggle_button_get_active (self))
]

{ #category : 'testing' }
GtkToggleButton >> isDrawingIndicator [

	self deprecated: #Gtk4
]

{ #category : 'testing' }
GtkToggleButton >> isInconsistent [

	self deprecated: #Gtk4
]
