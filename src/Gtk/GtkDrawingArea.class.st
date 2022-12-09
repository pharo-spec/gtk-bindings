"
I'm a widget for custom user interface elements.

https://developer.gnome.org/gtk3/stable/GtkDrawingArea.html
"
Class {
	#name : #GtkDrawingArea,
	#superclass : #GtkWidget,
	#instVars : [
		'drawing',
		'requestedSize',
		'drawFunction'
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

	"This is gone in GTK4 with no direct replacement. 
	 But for some usecases there are alternatives. 
	 If you want to make the background transparent, you can set the 
	 background color to, for example, rgba(255, 255, 255, 0) 
	 using CSS instead."
	
	self deprecated: #Gtk4
]

{ #category : #signaling }
GtkDrawingArea >> connectDraw: aBlock [

	self 
		deprecated: #Gtk4
		transformWith: '@receiver connectDraw: `aBlock' -> '@receiver drawFunction: `aBlock'
]

{ #category : #initialization }
GtkDrawingArea >> connectDrawFunction [

	drawFunction := GCallback 
		signature: #(void (void *widget, void *cr, int width, int height, gpointer user_data)) 
		block: [ :widget :cr :width :height :user_data | 
			self draw: cr ].
	self setDrawFunc: drawFunction
]

{ #category : #signaling }
GtkDrawingArea >> connectResize: aBlock [

	(GResizeCallback do: aBlock) connectTo: self
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
	"self appPaintable: true."
	self registerToEvents.
	self connectToSignals.
	self connectDrawFunction
]

{ #category : #initialization }
GtkDrawingArea >> registerToAllEvents [
	"call this method when you want to receive events of anykind. 
	 you will need to connect to them and handle them after."

self flag: #TODO.
	"self events: GDK_ALL_EVENTS_MASK value"
]

{ #category : #initialization }
GtkDrawingArea >> registerToEvents [

]

{ #category : #private }
GtkDrawingArea >> setDrawFunc: draw_func [

	self ffiCall: #(void gtk_drawing_area_set_draw_func (
  		self,
		"GtkDrawingAreaDrawFunc" GCallback draw_func,
  		"gpointer user_data" NULL,
  		"GDestroyNotify destroy" NULL))
]

{ #category : #private }
GtkDrawingArea >> setSizeRequestWidth: width height: height [
	
	self
		ffiCall: #(void gtk_widget_set_size_request #(self , gint width , gint height))
]
