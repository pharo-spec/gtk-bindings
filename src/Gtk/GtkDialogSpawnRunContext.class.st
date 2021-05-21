Class {
	#name : #GtkDialogSpawnRunContext,
	#superclass : #GtkDialogRunContext,
	#instVars : [
		'runLoop'
	],
	#category : #'Gtk-Widget-Window'
}

{ #category : #'debugging actions' }
GtkDialogSpawnRunContext >> resume [

	runLoop uninstallRunLoop.
	dialogClosed := true
]

{ #category : #private }
GtkDialogSpawnRunContext >> waitForAnswer [ 

	runLoop := GtkRunLoop current spawnNewRunLoop
]
