Class {
	#name : 'GtkApplicationRunLoop',
	#superclass : 'GtkRunLoop',
	#instVars : [
		'engine'
	],
	#category : 'Gtk-App-Experimental',
	#package : 'Gtk',
	#tag : 'App-Experimental'
}

{ #category : 'accessing' }
GtkApplicationRunLoop >> engine [

	^ engine
]

{ #category : 'accessing' }
GtkApplicationRunLoop >> engine: anEngine [

	engine := anEngine
]

{ #category : 'private - installing' }
GtkApplicationRunLoop >> installRunLoop [
	"this will be run in GtkApplicationEngine"
]
