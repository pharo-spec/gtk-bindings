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

	self connectSizeAllocate: [ :aRect | boundingBox := aRect ]
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
	aCanvas surface
		drawDuring: [ :canvas | 
			canvas
				clipBy: self boundingBox
				during: [ drawBlock cull: canvas cull: self boundingBox ] ]
]
