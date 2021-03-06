"
GtkToggleButton
GtkToggleButton — Create buttons which retain their state

https://developer.gnome.org/gtk3/unstable/GtkToggleButton.html
"
Class {
	#name : #GtkToggleButton,
	#superclass : #GtkButton,
	#category : #'Gtk-Widget-Buttons'
}

{ #category : #private }
GtkToggleButton class >> buttonNew [
	^ self ffiCall: #(GtkToggleButton *gtk_toggle_button_new ())
]

{ #category : #private }
GtkToggleButton class >> buttonNewWithLabel: utf8EncodedString [

	^ self ffiCall: #(GtkToggleButton *gtk_toggle_button_new_with_label (String utf8EncodedString))
]

{ #category : #accessing }
GtkToggleButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_toggle_button_get_type())
]

{ #category : #private }
GtkToggleButton >> active: aBoolean [

	^ self ffiCall: #(void gtk_toggle_button_set_active (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkToggleButton >> beActive [

	self active: true
]

{ #category : #accessing }
GtkToggleButton >> beNonActive [

	self active: false
]

{ #category : #signaling }
GtkToggleButton >> connectToggled: aBlock [

	(GToggledCallback do: aBlock) connectTo: self
]

{ #category : #accessing }
GtkToggleButton >> doNotDrawIndicator [

	^ self drawIndicator: false
]

{ #category : #accessing }
GtkToggleButton >> drawIndicator [

	^ self drawIndicator: true
]

{ #category : #private }
GtkToggleButton >> drawIndicator: aBoolean [

	^ self ffiCall: #(void gtk_toggle_button_set_mode (self, gboolean aBoolean))
]

{ #category : #private }
GtkToggleButton >> getActive [

	^ self isActive
]

{ #category : #accessing }
GtkToggleButton >> inconsistent: aBoolean [

	^ self ffiCall: #(void gtk_toggle_button_set_inconsistent (self, gboolean aBoolean))
]

{ #category : #testing }
GtkToggleButton >> isActive [

	^ self ffiCall: #(gboolean gtk_toggle_button_get_active (self))
]

{ #category : #testing }
GtkToggleButton >> isDrawingIndicator [

	^ self ffiCall: #(gboolean gtk_toggle_button_get_mode (self))
]

{ #category : #testing }
GtkToggleButton >> isInconsistent [

	^ self ffiCall: #(gboolean gtk_toggle_button_get_inconsistent (self))
]
