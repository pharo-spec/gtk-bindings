"
I indicate when I am trying to release an already released object (it is a zombie, alive in this side but not anymore in gtk3 side)
"
Class {
	#name : #GZombieAnnouncement,
	#superclass : #GFinalizeAnnouncement,
	#category : #'GObject-Signal'
}

{ #category : #logging }
GZombieAnnouncement >> logIn: aLogger [

	^ aLogger logZombieSignal: self
]
