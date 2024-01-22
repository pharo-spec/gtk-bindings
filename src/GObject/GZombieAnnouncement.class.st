"
I indicate when I am trying to release an already released object (it is a zombie, alive in this side but not anymore in GTK side)
"
Class {
	#name : 'GZombieAnnouncement',
	#superclass : 'GFinalizeAnnouncement',
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'logging' }
GZombieAnnouncement >> logIn: aLogger [

	^ aLogger logZombieSignal: self
]
