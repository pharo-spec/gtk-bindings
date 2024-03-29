"
I'm a widget for custom user interface elements.

https://developer.gnome.org/gtk3/stable/GtkDrawingArea.html
"
Class {
	#name : #GtkDrawingArea,
	#superclass : #GtkWidget,
	#instVars : [
		'drawing',
		'requestedSize'
	],
	#pools : [
		'GdkEventMask',
		'GdkEventType'
	],
	#category : #'Gtk-Widget'
}

{ #category : #private }
GtkDrawingArea class >> drawingAreaNew [

	^ self ffiCall: #(GtkDrawingArea *gtk_drawing_area_new ())
]

{ #category : #accessing }
GtkDrawingArea class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_drawing_area_get_type())
]

{ #category : #'instance creation' }
GtkDrawingArea class >> new [
	^ self drawingAreaNew initialize
]

{ #category : #accessing }
GtkDrawingArea >> appPaintable: app_paintable [

	^ self ffiCall: #(void gtk_widget_set_app_paintable (self, gboolean app_paintable))
]

{ #category : #signaling }
GtkDrawingArea >> connectDraw: aBlock [

	^ (GDrawCallback do: aBlock) connectTo: self
]

{ #category : #initialization }
GtkDrawingArea >> connectToSignals [
]

{ #category : #drawing }
GtkDrawingArea >> draw: cr [

	[ self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr) ]
	on: Error 
	fork: [ :e | e debug ].
	
	^ true
]

{ #category : #drawing }
GtkDrawingArea >> drawOnAthensCanvas: aCanvas [
	self subclassResponsibility
]

{ #category : #private }
GtkDrawingArea >> extent: aPoint [
	requestedSize := aPoint.
	self setSizeRequestWidth: aPoint x height: aPoint y
]

{ #category : #private }
GtkDrawingArea >> getSizeRequest [
	| width height |
	
	width := FFIInt32 newBuffer.
	height := FFIInt32 newBuffer.
	
	self getSizeRequestWidth: width height: height. 
	
	^ (width signedLongAt: 1) @ (height signedLongAt: 1)
]

{ #category : #private }
GtkDrawingArea >> getSizeRequestWidth: width height: height [
	self
		ffiCall: #(void gtk_widget_get_size_request #(self , gint width , gint height)).
]

{ #category : #initialization }
GtkDrawingArea >> initialize [

	super initialize.
	self hExpand: true.
	self vExpand: true.
	self appPaintable: true.
	self registerToEvents.
	self connectToSignals.
	self connectDraw: [ :cr | self draw: cr ]
]

{ #category : #initialization }
GtkDrawingArea >> registerToAllEvents [
	"call this method when you want to receive events of anykind. 
	 you will need to connect to them and handle them after."

	self events: GDK_ALL_EVENTS_MASK value
]

{ #category : #initialization }
GtkDrawingArea >> registerToEvents [

]

{ #category : #private }
GtkDrawingArea >> setSizeRequestWidth: width height: height [
	
	self
		ffiCall: #(void gtk_widget_set_size_request #(self , gint width , gint height))
]
