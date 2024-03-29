"
GtkLinkButton
GtkLinkButton — Create buttons bound to a URL

https://developer.gnome.org/gtk3/unstable/GtkLinkButton.html
"
Class {
	#name : #GtkLinkButton,
	#superclass : #GtkButton,
	#category : #'Gtk-Widget-Buttons'
}

{ #category : #private }
GtkLinkButton class >> buttonNew [
	
	self shouldNotImplement
]

{ #category : #private }
GtkLinkButton class >> buttonNewWithLabel: utf8EncodedString [
	
	self shouldNotImplement
]

{ #category : #private }
GtkLinkButton class >> buttonNewWithUri: utf8EncodedUrl [
	
	^ self ffiCall: #(GtkLinkButton *gtk_link_button_new (String utf8EncodedUrl))
]

{ #category : #private }
GtkLinkButton class >> buttonNewWithUri: utf8EncodedUrl withLabel: utf8EncodedString [
	
	^ self ffiCall: #(GtkLinkButton *gtk_link_button_new_with_label (String utf8EncodedUrl, String utf8EncodedString))
]

{ #category : #accessing }
GtkLinkButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_link_button_get_type())
]

{ #category : #'instance creation' }
GtkLinkButton class >> newWithUri: aString [

	^ (self buttonNewWithUri: aString) initialize
]

{ #category : #'instance creation' }
GtkLinkButton class >> newWithUri: aString withLabel: aLabel [

	^ (self 
		buttonNewWithUri: aString
		withLabel: aLabel)
		initialize
]

{ #category : #events }
GtkLinkButton >> connectActivateLink: aBlock [
	"aBlock receives zero arguments
	 aBlock needs to return a Boolean"

	(GActivateLinkCallback do: aBlock) connectTo: self 
]

{ #category : #private }
GtkLinkButton >> gtkLinkButtonGetUri [

	^ self ffiCall: #(gchar *gtk_link_button_get_uri (self))
]

{ #category : #private }
GtkLinkButton >> gtkLinkButtonSetUri: utf8EncodedUri [

	^ self ffiCall: #(void gtk_link_button_set_uri (self, String utf8EncodedUri))
]

{ #category : #accessing }
GtkLinkButton >> isVisited [

	^ self ffiCall: #(gboolean gtk_link_button_get_visited (self))
]

{ #category : #accessing }
GtkLinkButton >> uri [

	^ self gtkLinkButtonGetUri
]

{ #category : #accessing }
GtkLinkButton >> uri: aString [

	^ self gtkLinkButtonSetUri: aString
]

{ #category : #accessing }
GtkLinkButton >> visited: aBoolean [

	^ self ffiCall: #(void gtk_link_button_set_visited (self, gboolean visited))
]
