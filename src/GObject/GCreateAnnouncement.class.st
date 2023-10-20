"
I signal a widget has just been created.
"
Class {
	#name : 'GCreateAnnouncement',
	#superclass : 'GWidgetBaseAnnouncement',
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'as yet unclassified' }
GCreateAnnouncement >> logIn: aLogger [

	^ aLogger logCreateSignal: self
]
