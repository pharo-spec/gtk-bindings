"
I'm a base morphic drawing area. 
I define common behaviour for my children. They will be resposibly to draw Morphs or other morphic related elements (like GtkFormView, used to display a full World).
"
Class {
	#name : #GtkMorphicDrawingArea,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'eventHandler'
	],
	#category : #'Gtk-Morphic'
}

{ #category : #drawing }
GtkMorphicDrawingArea >> basicDraw: cr [

	"do nothing"
]

{ #category : #'private - primitives' }
GtkMorphicDrawingArea >> cairoCreate: target [

	^ self 
		ffiCall: #("cairo_t"void *cairo_create ("cairo_surface_t"void *target))
		module: CairoLibrary
]

{ #category : #'private - primitives' }
GtkMorphicDrawingArea >> cairoDestroy: cr [

	^ self 
		ffiCall: #(void cairo_destroy ("cairo_t *"void *cr))
		module: CairoLibrary
]

{ #category : #'private - primitives' }
GtkMorphicDrawingArea >> cairoRectangle: aCr x: xValue y: yValue	width: aWidth height: aHeight [

	self 
		ffiCall: #(void cairo_rectangle (void *aCr,
                 double xValue,
                 double yValue,
                 double aWidth,
                 double aHeight))
		module: CairoLibrary
]

{ #category : #private }
GtkMorphicDrawingArea >> canDraw [

	self subclassResponsibility
]

{ #category : #initialization }
GtkMorphicDrawingArea >> connectToSignals [

	self addController: (GtkEventControllerLegacy new 
		connectEvent: [ :event | self handleEvent: event ];
		yourself)
]

{ #category : #private }
GtkMorphicDrawingArea >> currentExtent [

	self subclassResponsibility
]

{ #category : #drawing }
GtkMorphicDrawingArea >> draw: cr [

	self subclassResponsibility
]

{ #category : #private }
GtkMorphicDrawingArea >> eventHandler [

	^ eventHandler
]

{ #category : #accessing }
GtkMorphicDrawingArea >> eventHandler: aHandler [

	eventHandler := aHandler
]

{ #category : #'private - events' }
GtkMorphicDrawingArea >> handleEvent: event [

	"event isEventConfigure ifTrue: [
		event extent = self currentExtent ifFalse: [
			self invalidate.
			^ true ] ]."

	^ eventHandler handleEvent: (event withPositionRelativeTo: self)
]

{ #category : #testing }
GtkMorphicDrawingArea >> hasEventHandler [

	^ eventHandler notNil
]

{ #category : #initialization }
GtkMorphicDrawingArea >> initialize [ 

	super initialize.
	self canFocus: true
]

{ #category : #accessing }
GtkMorphicDrawingArea >> invalidate [

	self subclassResponsibility
]

{ #category : #accessing }
GtkMorphicDrawingArea >> invalidateRect: damageRect [

	self subclassResponsibility
]

{ #category : #initialization }
GtkMorphicDrawingArea >> newDrawFunction [

	^ GCallback 
		signature: #(void (void *widget, void *cr, int width, int height, gpointer user_data)) 
		block: [ :widget :cr :width :height :user_data |
			self resizeIfEnabledTo: (width@height).
			self draw: cr ]
]

{ #category : #'private - primitives' }
GtkMorphicDrawingArea >> paint: cr [

	self 
		ffiCall: #(void cairo_paint (void *cr))
		module: CairoLibrary
]

{ #category : #accessing }
GtkMorphicDrawingArea >> queueDraw [
	
	"(drawing or: [ drawQueued ]) ifTrue: [ ^ self ].
	drawQueued := true."
	super queueDraw
]

{ #category : #initialization }
GtkMorphicDrawingArea >> registerToEvents [

	self registerToAllEvents
]

{ #category : #private }
GtkMorphicDrawingArea >> resizeIfEnabledTo: extent [

	self subclassResponsibility
]

{ #category : #'private - primitives' }
GtkMorphicDrawingArea >> setSourceSurfaceTo: cr surface: surface [

	self 
		setSourceSurfaceTo: cr 
		surface: surface 
		x: 0.0 
		y: 0.0
]

{ #category : #'private - primitives' }
GtkMorphicDrawingArea >> setSourceSurfaceTo: cr surface: surface x: x y: y [

	self 
		ffiCall: #(void cairo_set_source_surface (void *cr, void *surface, double x, double y))
		module: CairoLibrary
]

{ #category : #'private - updating' }
GtkMorphicDrawingArea >> updateSurface [

	self subclassResponsibility
]

{ #category : #accessing }
GtkMorphicDrawingArea >> world [ 

	self subclassResponsibility
]
