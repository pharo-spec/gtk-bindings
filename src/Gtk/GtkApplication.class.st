Class {
	#name : #GtkApplication,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'runLoop',
		'windowRegistry',
		'shutdownRegistry',
		'resourceManager'
	],
	#classVars : [
		'Current'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Base'
}
