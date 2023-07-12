"
I signal a widget has just been created.
"
Class {
	#name : #GCreateAnnouncement,
	#superclass : #GWidgetBaseAnnouncement,
	#category : #'GObject-Signal'
}

{ #category : #logging }
GCreateAnnouncement >> logIn: aLogger [

	^ aLogger logCreateSignal: self
]
