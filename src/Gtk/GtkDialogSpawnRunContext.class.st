Class {
	#name : 'GtkDialogSpawnRunContext',
	#superclass : 'GtkDialogRunContext',
	#instVars : [
		'runLoop'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'debugging actions' }
GtkDialogSpawnRunContext >> resume [

	runLoop uninstallRunLoop.
	dialogClosed := true
]

{ #category : 'private' }
GtkDialogSpawnRunContext >> waitForAnswer [ 

	runLoop := GRunLoop current spawnNewRunLoop
]
