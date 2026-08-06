"
Flags used to set what a GFileMonitor will watch for.

https://docs.gtk.org/gio/flags.FileMonitorFlags.html
"
Class {
	#name : 'GFileMonitorFlags',
	#superclass : 'GEnumeration',
	#classVars : [
		'G_FILE_MONITOR_NONE',
		'G_FILE_MONITOR_SEND_MOVED',
		'G_FILE_MONITOR_WATCH_HARD_LINKS',
		'G_FILE_MONITOR_WATCH_MOUNTS',
		'G_FILE_MONITOR_WATCH_MOVES'
	],
	#category : 'GLib-IO-Base',
	#package : 'GLib-IO',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
GFileMonitorFlags class >> G_FILE_MONITOR_NONE [
	"This method was automatically generated"
	^ G_FILE_MONITOR_NONE
]

{ #category : 'accessing enum' }
GFileMonitorFlags class >> G_FILE_MONITOR_SEND_MOVED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_SEND_MOVED
]

{ #category : 'accessing enum' }
GFileMonitorFlags class >> G_FILE_MONITOR_WATCH_HARD_LINKS [
	"This method was automatically generated"
	^ G_FILE_MONITOR_WATCH_HARD_LINKS
]

{ #category : 'accessing enum' }
GFileMonitorFlags class >> G_FILE_MONITOR_WATCH_MOUNTS [
	"This method was automatically generated"
	^ G_FILE_MONITOR_WATCH_MOUNTS
]

{ #category : 'accessing enum' }
GFileMonitorFlags class >> G_FILE_MONITOR_WATCH_MOVES [
	"This method was automatically generated"
	^ G_FILE_MONITOR_WATCH_MOVES
]

{ #category : 'enum declaration' }
GFileMonitorFlags class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors.
	"

	^ #( 
	G_FILE_MONITOR_NONE 				0 
	G_FILE_MONITOR_WATCH_MOUNTS 		1 
	G_FILE_MONITOR_SEND_MOVED 		2 
	G_FILE_MONITOR_WATCH_HARD_LINKS 	4 
	G_FILE_MONITOR_WATCH_MOVES 		8 
	)
]
