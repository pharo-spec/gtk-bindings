"
GtkSpinner
GtkSpinner — Show a spinner animation

https://developer.gnome.org/gtk3/stable/GtkSpinner.html
"
Class {
	#name : #GtkSpinner,
	#superclass : #GtkWidget,
	#pools : [
		'GtkJustification'
	],
	#category : #'Gtk-Widget-Display'
}

{ #category : #accessing }
GtkSpinner class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_spinner_get_type())
]

{ #category : #private }
GtkSpinner class >> gtkSpinnerNew [

	^ self ffiCall: #(GtkSpinner *gtk_spinner_new (void))
]

{ #category : #'instance creation' }
GtkSpinner class >> new [
	^ self gtkSpinnerNew initialize
]

{ #category : #accessing }
GtkSpinner >> start [

	self ffiCall: #(void gtk_spinner_start (self))
]

{ #category : #accessing }
GtkSpinner >> stop [

	self ffiCall: #(void gtk_spinner_stop (self))
]
