"
GtkFrame
GtkFrame — A bin with a decorative frame and optional label

https://docs.gtk.org/gtk4/class.Frame.html
"
Class {
	#name : 'GtkFrame',
	#superclass : 'GtkWidget',
	#traits : 'GtkTBin',
	#classTraits : 'GtkTBin classTrait',
	#instVars : [
		'labelWidget'
	],
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'private' }
GtkFrame class >> gtkFrameNew [

	^ self ffiCall: #(GtkFrame *gtk_frame_new (NULL))
]

{ #category : 'private' }
GtkFrame class >> gtkFrameNewWithLabel: label [

	^ self ffiCall: #(GtkFrame *gtk_frame_new (gchar *label))
]

{ #category : 'instance creation' }
GtkFrame class >> new [

	^ self gtkFrameNew initialize
]

{ #category : 'instance creation' }
GtkFrame class >> newLabel: aString [

	^ (self gtkFrameNewWithLabel: aString) initialize
]

{ #category : 'private' }
GtkFrame >> getLabelWidget [

	self ffiCall: #(GtkWidget *gtk_frame_get_label_widget (self))
]

{ #category : 'accessing' }
GtkFrame >> label [

	self ffiCall: #(gchar *gtk_frame_set_label (self))
]

{ #category : 'accessing' }
GtkFrame >> label: label [

	self ffiCall: #(void gtk_frame_set_label (self, const gchar *label))
]

{ #category : 'accessing' }
GtkFrame >> labelWidget [

	^ labelWidget ifNil: [ labelWidget := self getLabelWidget ]
]

{ #category : 'accessing' }
GtkFrame >> labelWidget: label_widget [

	labelWidget := label_widget.
	self setLabelWidget: label_widget
]

{ #category : 'private' }
GtkFrame >> setChild: aWidget [

	^ self ffiCall: #(void gtk_frame_set_child (self, GtkWidget* child))
]

{ #category : 'private' }
GtkFrame >> setLabelWidget: label_widget [

	self ffiCall: #(void gtk_frame_set_label_widget (self, GtkWidget *label_widget))
]
