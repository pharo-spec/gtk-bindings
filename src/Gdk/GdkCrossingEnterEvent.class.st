Class {
	#name : #GdkCrossingEnterEvent,
	#superclass : #GdkCrossingEvent,
	#category : #'Gdk-Events'
}

{ #category : #testing }
GdkCrossingEnterEvent class >> isType: aType [

	^ aType = GDK_ENTER_NOTIFY
]

{ #category : #testing }
GdkCrossingEnterEvent >> isEnter [

	^ true
]
