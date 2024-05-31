"
I'm a widget to display a world contained in a Form.
Being a Form a bitmap, this component could be used to display any kind of Form, containded in a World (provided through the event handler).
"
Class {
	#name : 'GtkFormView',
	#superclass : 'GtkMorphicDrawingArea',
	#instVars : [
		'form',
		'surface'
	],
	#category : 'Gtk-Morphic',
	#package : 'Gtk-Morphic'
}

{ #category : 'private' }
GtkFormView class >> drawingAreaNew [

	^ self ffiCall: #(GtkFormView *gtk_drawing_area_new ())
]

{ #category : 'examples' }
GtkFormView class >> example [

	GEngine ensureRunning.
	GRunLoop defer: [
		GtkWindow new
			defaultSize: 500@500;
			child: (self new
				form: (Smalltalk ui icons iconNamed: #pharoBig);
				yourself);
			present ]
]

{ #category : 'private' }
GtkFormView >> canDraw [

	^ true
]

{ #category : 'private' }
GtkFormView >> currentExtent [

	^ self form extent
]

{ #category : 'drawing' }
GtkFormView >> draw: aCr [
	
	surface ifNil: [ ^ self ]. 
	surface fillInto: aCr
]

{ #category : 'accessing' }
GtkFormView >> form [

	^ form
]

{ #category : 'accessing' }
GtkFormView >> form: aForm [

	form := aForm.
	self sizeRequest: aForm extent.
	self invalidate	
]

{ #category : 'events' }
GtkFormView >> handleEvent: anEvent [

	self tryFocus: anEvent.  
	self hasEventHandler ifFalse: [ ^ false ].
	^ super handleEvent: anEvent
]

{ #category : 'testing' }
GtkFormView >> hasWorld [

	^ self hasEventHandler and: [ self world notNil ]
]

{ #category : 'accessing' }
GtkFormView >> invalidate [

	self updateSurface.
	self queueDraw
]

{ #category : 'accessing' }
GtkFormView >> invalidateRect: damageRect [

	self updateSurfaceRectangle: damageRect.
	self queueDraw
]

{ #category : 'private' }
GtkFormView >> resizeIfEnabledTo: extent [

	self hasWorld ifFalse: [ ^ self ].
	self world worldState worldRenderer checkForNewScreenSize
]

{ #category : 'events' }
GtkFormView >> tryFocus: anEvent [
	
	anEvent type = GdkEventType GDK_ENTER_NOTIFY ifFalse: [ ^ self ].
	self grabFocus
]

{ #category : 'private - updating' }
GtkFormView >> updateSurface [

	surface := GtkCairoSurface fromForm: form
]

{ #category : 'private - updating' }
GtkFormView >> updateSurfaceRectangle: aRect [
	| origin newForm |
	
	surface ifNil: [ ^ self updateSurface ].
	
	origin := aRect origin.
	newForm := Form extent: aRect extent depth: 32.
	newForm
		copy: (0@0 extent: aRect extent)
		from: origin
		in: self form
		rule: Form over.
	surface copyForm: newForm clippedBy: aRect at: origin
]

{ #category : 'accessing' }
GtkFormView >> world [ 

	^ self eventHandler morphicWorld
]
