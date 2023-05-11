"
I'm a widget that displays a small to medium amount of text.

https://docs.gtk.org/gtk4/class.Label.html
"
Class {
	#name : #GtkLabel,
	#superclass : #GtkWidget,
	#pools : [
		'GtkJustification'
	],
	#category : #'Gtk-Widget-Display'
}

{ #category : #accessing }
GtkLabel class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_label_get_type())
]

{ #category : #private }
GtkLabel class >> labelNew: str [
	^ self ffiCall: #(GtkLabel *gtk_label_new (String str))
]

{ #category : #'instance creation' }
GtkLabel class >> new [
	^ (self labelNew: nil) initialize
]

{ #category : #'instance creation' }
GtkLabel class >> newLabel: aString [

	^ (self labelNew: aString) initialize
]

{ #category : #accessing }
GtkLabel >> attributes: attrs [ 

	self ffiCall: #(void gtk_label_set_attributes (self, PangoAttrList *attrs))
]

{ #category : #private }
GtkLabel >> basicText [
	^ self ffiCall: #(String gtk_label_get_text (self))
]

{ #category : #private }
GtkLabel >> basicText: utf8EncodedString [

	^ self ffiCall: #(void gtk_label_set_text (self, String utf8EncodedString))
]

{ #category : #accessing }
GtkLabel >> beJustifyCenter [
	self justify: GTK_JUSTIFY_CENTER
]

{ #category : #accessing }
GtkLabel >> beJustifyFill [
	self justify: GTK_JUSTIFY_FILL
]

{ #category : #accessing }
GtkLabel >> beJustifyLeft [
	self justify: GTK_JUSTIFY_LEFT
]

{ #category : #accessing }
GtkLabel >> beJustifyRight [
	self justify: GTK_JUSTIFY_RIGHT
]

{ #category : #initialization }
GtkLabel >> initialize [ 
	super initialize.
	self hAlignStart.
	self vAlignCenter
]

{ #category : #testing }
GtkLabel >> isWrap [

	^ self ffiCall: #(gboolean gtk_label_get_line_wrap (self))
]

{ #category : #accessing }
GtkLabel >> justify: jtype [ 
	self ffiCall: #(void gtk_label_set_justify (self, GtkJustification jtype))
]

{ #category : #accessing }
GtkLabel >> label [
	
	self ffiCall: #(String gtk_label_get_label (self))
]

{ #category : #accessing }
GtkLabel >> label: aString [ 
	
	self ffiCall: #(void gtk_label_set_label (self, String aString))
]

{ #category : #accessing }
GtkLabel >> markup: aString [ 
	
	self ffiCall: #(void gtk_label_set_markup (self, String aString))
]

{ #category : #accessing }
GtkLabel >> mnemonicWidget: widget [

	self ffiCall: #(void gtk_label_set_mnemonic_widget (self, GtkWidget *widget))
]

{ #category : #accessing }
GtkLabel >> text [
	
	^ self basicText
]

{ #category : #accessing }
GtkLabel >> text: str [
	
	self basicText: str
]

{ #category : #accessing }
GtkLabel >> textWithMnemonic: str [

	self ffiCall: #(void gtk_label_set_text_with_mnemonic (self, const gchar *str))
]

{ #category : #testing }
GtkLabel >> useUnderline [

	self ffiCall: #(gboolean gtk_label_get_use_underline (self))
]

{ #category : #accessing }
GtkLabel >> useUnderline: setting [

	self ffiCall: #(void gtk_label_set_use_underline (self, gboolean setting))
]

{ #category : #accessing }
GtkLabel >> wrap: wrap [

	self ffiCall: #(void gtk_label_set_line_wrap (self, gboolean wrap))
]
