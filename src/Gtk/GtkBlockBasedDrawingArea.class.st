Class {
	#name : #GtkBlockBasedDrawingArea,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'drawBlock',
		'boundingBox'
	],
	#category : #'Gtk-Widget'
}

{ #category : #private }
GtkBlockBasedDrawingArea class >> drawingAreaNew [
	^ self ffiCall: #( GtkBlockBasedDrawingArea *gtk_drawing_area_new () )
]

{ #category : #accessing }
GtkBlockBasedDrawingArea >> boundingBox [ 

	^ boundingBox ifNil: [ super boundingBox ]
]

{ #category : #initialization }
GtkBlockBasedDrawingArea >> connectToSignals [

	self connectResize: [ :anExtent | (0@0) corner: anExtent ]
]

{ #category : #drawing }
GtkBlockBasedDrawingArea >> drawBlock [

	^ drawBlock
]

{ #category : #drawing }
GtkBlockBasedDrawingArea >> drawBlock: aBlock [

	drawBlock := aBlock
]

{ #category : #drawing }
GtkBlockBasedDrawingArea >> drawOnAthensCanvas: aCanvas [

	aCanvas surface drawDuring: [ :canvas | 
		drawBlock 
			cull: canvas 
			cull: self boundingBox ]
]
