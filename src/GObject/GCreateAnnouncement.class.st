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

{ #category : 'logging' }
GCreateAnnouncement >> logIn: aLogger [

	^ aLogger logCreateSignal: self
]
