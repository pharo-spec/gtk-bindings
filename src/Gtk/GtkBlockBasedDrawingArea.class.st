Class {
	#name : 'GtkBlockBasedDrawingArea',
	#superclass : 'GtkDrawingArea',
	#instVars : [
		'drawBlock',
		'boundingBox'
	],
	#category : 'Gtk-Widget',
	#package : 'Gtk',
	#tag : 'Widget'
}

{ #category : 'private' }
GtkBlockBasedDrawingArea class >> drawingAreaNew [
	^ self ffiCall: #( GtkBlockBasedDrawingArea *gtk_drawing_area_new () )
]

{ #category : 'examples' }
GtkBlockBasedDrawingArea class >> example [

	GtkEngine ensureRunning.
	GRunLoop defer: [ 
		GtkWindow new 
			defaultSize: 500@500;
			child: (self new
				drawBlock: [ :aCanvas :boundingBox | 
					| paint surface |
					surface := aCanvas surface.
					paint := surface 
						createLinearGradient: { 
							0->Color red. 
							1->Color green } 
						start: 0@0 
						stop: boundingBox extent.
					surface clear.
					aCanvas setPaint: paint.
					aCanvas drawShape: (0@0 corner: boundingBox extent) ];
				yourself);
			present ]
]

{ #category : 'drawing' }
GtkBlockBasedDrawingArea >> basicDraw: cr [
	
	drawBlock 
		value: cr
		value: self boundingBox
]

{ #category : 'accessing' }
GtkBlockBasedDrawingArea >> boundingBox [ 

	^ boundingBox ifNil: [ super boundingBox ]
]

{ #category : 'initialization' }
GtkBlockBasedDrawingArea >> connectToSignals [

	"self connectResize: [ :anExtent | (0@0) corner: anExtent ]"
]

{ #category : 'drawing' }
GtkBlockBasedDrawingArea >> drawBlock [

	^ drawBlock
]

{ #category : 'drawing' }
GtkBlockBasedDrawingArea >> drawBlock: aBlock [

	drawBlock := aBlock
]

{ #category : 'initialization' }
GtkBlockBasedDrawingArea >> newDrawFunction [
	
	^ GCallback 
		signature: #(void (void *widget, void *cr, int width, int height, gpointer user_data)) 
		block: [ :widget :cr :width :height :user_data | 
			boundingBox := (0@0) corner: (width@height).
			self draw: cr ]
]
