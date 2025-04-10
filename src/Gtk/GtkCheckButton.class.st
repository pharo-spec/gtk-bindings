"
GtkCheckButton
GtkCheckButton — Create widgets with a discrete toggle button

https://developer.gnome.org/gtk3/unstable/GtkCheckButton.html
"
Class {
	#name : 'GtkCheckButton',
	#superclass : 'GtkButton',
	#traits : 'GtkTToggleableButton',
	#classTraits : 'GtkTToggleableButton classTrait',
	#category : 'Gtk-Widget-Buttons',
	#package : 'Gtk',
	#tag : 'Widget-Buttons'
}

{ #category : 'private' }
GtkCheckButton class >> buttonNew [

	^ self ffiCall: #(GtkCheckButton *gtk_check_button_new (void))
]

{ #category : 'private' }
GtkCheckButton class >> buttonNewWithLabel: utf8EncodedString [

	^ self ffiCall: #(GtkCheckButton *gtk_check_button_new_with_label (String utf8EncodedString))
]

{ #category : 'accessing' }
GtkCheckButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_check_button_get_type())
]

{ #category : 'accessing' }
GtkCheckButton >> active: aBoolean [

	^ self ffiCall: #(void gtk_check_button_set_active (self, gboolean aBoolean))
]

{ #category : 'private' }
GtkCheckButton >> getChild [

	self ffiCall: #(GtkWidget *gtk_check_button_get_child (self))
]

{ #category : 'private' }
GtkCheckButton >> getLabel [

	^ self ffiCall: #(gchar *gtk_check_button_get_label(self))
]

{ #category : 'accessing' }
GtkCheckButton >> group: aCheckButton [

	^ self ffiCall: #(void gtk_check_button_set_group (self, GtkCheckButton *aCheckButton))
]

{ #category : 'accessing' }
GtkCheckButton >> inconsistent: aBoolean [

	^ self ffiCall: #(void gtk_check_button_set_inconsistent (self, gboolean aBoolean))
]

{ #category : 'testing' }
GtkCheckButton >> isActive [

	^ self ffiCall: #(gboolean gtk_check_button_get_active (self))
]

{ #category : 'testing' }
GtkCheckButton >> isInconsistent [

	^ self ffiCall: #(gboolean gtk_check_button_get_inconsistent (self))
]

{ #category : 'private' }
GtkCheckButton >> setChild: aWidget [

	self ffiCall: #(void gtk_check_button_set_child (self, GtkWidget *aWidget))
]

{ #category : 'private' }
GtkCheckButton >> setLabel: aString [

	self ffiCall: #(void gtk_check_button_set_label(self, String aString))
]
