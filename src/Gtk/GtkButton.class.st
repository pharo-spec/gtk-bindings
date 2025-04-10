"
GtkButton — A widget that emits a signal when clicked on

https://developer.gnome.org/gtk3/stable/GtkButton.html
"
Class {
	#name : 'GtkButton',
	#superclass : 'GtkWidget',
	#instVars : [
		'child'
	],
	#pools : [
		'GtkPositionType',
		'GtkReliefStyle'
	],
	#category : 'Gtk-Widget-Buttons',
	#package : 'Gtk',
	#tag : 'Widget-Buttons'
}

{ #category : 'private' }
GtkButton class >> buttonNew [
	^ self ffiCall: #(GtkButton *gtk_button_new ())
]

{ #category : 'private' }
GtkButton class >> buttonNewWithLabel: label [
	^ self ffiCall: #(GtkButton *gtk_button_new_with_label (String label))
]

{ #category : 'accessing' }
GtkButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_button_get_type())
]

{ #category : 'instance creation' }
GtkButton class >> new [ 
	^ self buttonNew initialize
]

{ #category : 'instance creation' }
GtkButton class >> newLabel: aString [

	^ (self buttonNewWithLabel: aString) initialize
]

{ #category : 'accessing' }
GtkButton >> alwaysShowImage [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> alwaysShowImage: always_show [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> alwaysShowsImage [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> beImagePositionBottom [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> beImagePositionLeft [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> beImagePositionRight [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> beImagePositionTop [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> child [

	^ child ifNil: [ child := self getChild ]
]

{ #category : 'accessing' }
GtkButton >> child: aWidget [

	child := aWidget.
	self setChild: aWidget
]

{ #category : 'simulating' }
GtkButton >> clicked [

	self deprecated: #Gtk4
]

{ #category : 'signaling' }
GtkButton >> connectClicked: aBlock [

	(GClickedCallback do: aBlock) connectTo: self
]

{ #category : 'style' }
GtkButton >> font: aLogicalFont [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkButton >> getChild [

	^ self ffiCall: #(GtkWidget* gtk_button_get_child (self))
]

{ #category : 'private' }
GtkButton >> getImage [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkButton >> getLabel [

	^ self ffiCall: #(gchar *gtk_button_get_label(self))
]

{ #category : 'accessing' }
GtkButton >> image [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> image: anImage [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> imagePosition [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> imagePosition: position [

	self deprecated: #Gtk4
]

{ #category : 'testing' }
GtkButton >> isAlwaysShowImage [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> label [

	^ self getLabel
]

{ #category : 'accessing' }
GtkButton >> label: aString [

	^ self setLabel: aString
]

{ #category : 'accessing' }
GtkButton >> reliefStyle [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkButton >> reliefStyle: relief [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkButton >> setChild: aWidget [

	self ffiCall: #(void gtk_button_set_child (self, GtkWidget *aWidget))
]

{ #category : 'private' }
GtkButton >> setImage: anImage [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkButton >> setLabel: aString [

	self ffiCall: #(void gtk_button_set_label(self, String aString))
]

{ #category : 'accessing' }
GtkButton >> setNoRelief [

	self reliefStyle: GTK_RELIEF_NONE
]

{ #category : 'accessing' }
GtkButton >> setNormalRelief [

	self reliefStyle: GTK_RELIEF_NORMAL
]

{ #category : 'accessing' }
GtkButton >> useNoUnderline [

	^ self useUnderline: false
]

{ #category : 'accessing' }
GtkButton >> useUnderline [

	^ self useUnderline: true
]

{ #category : 'accessing' }
GtkButton >> useUnderline: aBoolean [

	^ self ffiCall: #(void gtk_button_set_use_underline (self, gboolean aBoolean))
]

{ #category : 'accessing' }
GtkButton >> usesUnderline [

	^ self ffiCall: #(gboolean gtk_button_get_use_underline ())
]
