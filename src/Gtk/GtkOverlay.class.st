"
GtkOverlay — A container which overlays widgets on top of each other

https://developer.gnome.org/gtk3/stable/GtkOverlay.html
"
Class {
	#name : #GtkOverlay,
	#superclass : #GtkBin,
	#category : #'Gtk-Widget-Container'
}

{ #category : #accessing }
GtkOverlay class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_overlay_get_type())
]

{ #category : #'instance  creation' }
GtkOverlay class >> new [

	^ self overlayNew initialize
]

{ #category : #private }
GtkOverlay class >> overlayNew [

	^ self ffiCall: #(GtkOverlay *gtk_overlay_new  (void))
]

{ #category : #adding }
GtkOverlay >> addOverlay: aWidget [

	self keepWidget: aWidget.
	self basicAddOverlay: aWidget.
]

{ #category : #adding }
GtkOverlay >> basicAddOverlay: aWidget [

	^ self ffiCall: #(void gtk_overlay_add_overlay (self, GtkWidget *aWidget))
]

{ #category : #adding }
GtkOverlay >> setOverlayPassThrougth: boolean child: aChild [

	^ self ffiCall: #(void gtk_overlay_set_overlay_pass_through (self, GtkWidget *aChild, gboolean boolean))
]
