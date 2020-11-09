Class {
	#name : #ITGtkIconThemeApplication,
	#superclass : #SpApplication,
	#category : #IconThemeBrowser
}

{ #category : #initialization }
ITGtkIconThemeApplication >> initialize [

	super initialize.
	self useBackend: #Gtk
]

{ #category : #running }
ITGtkIconThemeApplication >> start [

	(self new: ITGtkIconThemeBrowser) openWithSpec
]
