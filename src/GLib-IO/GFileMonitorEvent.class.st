"
Specifies what type of event a file monitor event is.

https://docs.gtk.org/gio/enum.FileMonitorEvent.html
"
Class {
	#name : 'GFileMonitorEvent',
	#superclass : 'GEnumeration',
	#classVars : [
		'G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED',
		'G_FILE_MONITOR_EVENT_CHANGED',
		'G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT',
		'G_FILE_MONITOR_EVENT_CREATED',
		'G_FILE_MONITOR_EVENT_DELETED',
		'G_FILE_MONITOR_EVENT_MOVED',
		'G_FILE_MONITOR_EVENT_MOVED_IN',
		'G_FILE_MONITOR_EVENT_MOVED_OUT',
		'G_FILE_MONITOR_EVENT_PRE_UNMOUNT',
		'G_FILE_MONITOR_EVENT_RENAMED',
		'G_FILE_MONITOR_EVENT_UNMOUNTED'
	],
	#category : 'GLib-IO-Base',
	#package : 'GLib-IO',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_CHANGED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_CHANGED
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_CREATED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_CREATED
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_DELETED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_DELETED
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_MOVED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_MOVED
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_MOVED_IN [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_MOVED_IN
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_MOVED_OUT [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_MOVED_OUT
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_PRE_UNMOUNT [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_PRE_UNMOUNT
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_RENAMED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_RENAMED
]

{ #category : 'accessing enum' }
GFileMonitorEvent class >> G_FILE_MONITOR_EVENT_UNMOUNTED [
	"This method was automatically generated"
	^ G_FILE_MONITOR_EVENT_UNMOUNTED
]

{ #category : 'enum declaration' }
GFileMonitorEvent class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors.
	"

	^ #( 
	G_FILE_MONITOR_EVENT_CHANGED 			0 
	G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT 	1 
	G_FILE_MONITOR_EVENT_DELETED 			2 
	G_FILE_MONITOR_EVENT_CREATED 			3 
	G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED 	4 
	G_FILE_MONITOR_EVENT_PRE_UNMOUNT 		5 
	G_FILE_MONITOR_EVENT_UNMOUNTED 			6 
	G_FILE_MONITOR_EVENT_MOVED 				7 
	G_FILE_MONITOR_EVENT_RENAMED 			8 
	G_FILE_MONITOR_EVENT_MOVED_IN 			9 
	G_FILE_MONITOR_EVENT_MOVED_OUT 			10 
	)
]
