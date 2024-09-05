Class {
	#name : 'GdkCrossingEnterEvent',
	#superclass : 'GdkCrossingEvent',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkCrossingEnterEvent class >> isType: aType [

	^ aType = GDK_ENTER_NOTIFY
]

{ #category : 'testing' }
GdkCrossingEnterEvent >> isEnter [

	^ true
]
