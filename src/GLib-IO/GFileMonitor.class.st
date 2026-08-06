"
Monitors a file or directory for changes.

To obtain a GFileMonitor for a file or directory, use:
  aFile monitorFile
  aFile monitorDirectory

Connect to the #changed signal via #connectChanged: to receive notifications about changes.

https://docs.gtk.org/gio/class.FileMonitor.html
"
Class {
	#name : 'GFileMonitor',
	#superclass : 'GObject',
	#traits : 'GLibIOTLibrary',
	#classTraits : 'GLibIOTLibrary classTrait',
	#category : 'GLib-IO-Base',
	#package : 'GLib-IO',
	#tag : 'Base'
}

{ #category : 'private' }
GFileMonitor class >> gFileMonitorDirectory: aGFile flags: aFlags [

	^ self ffiCall: #(GFileMonitor *g_file_monitor_directory (GFile *aGFile, GFileMonitorFlags aFlags, NULL, NULL))
]

{ #category : 'private' }
GFileMonitor class >> gFileMonitorFile: aGFile flags: aFlags [

	^ self ffiCall: #(GFileMonitor *g_file_monitor_file (GFile *aGFile, GFileMonitorFlags aFlags, NULL, NULL))
]

{ #category : 'instance creation' }
GFileMonitor class >> onDirectory: aGFile [

	^ self onDirectory: aGFile flags: GFileMonitorFlags G_FILE_MONITOR_NONE
]

{ #category : 'instance creation' }
GFileMonitor class >> onDirectory: aGFile flags: aFlags [

	^ (self gFileMonitorDirectory: aGFile flags: aFlags) initialize
]

{ #category : 'instance creation' }
GFileMonitor class >> onFile: aGFile [

	^ self onFile: aGFile flags: GFileMonitorFlags G_FILE_MONITOR_NONE
]

{ #category : 'instance creation' }
GFileMonitor class >> onFile: aGFile flags: aFlags [

	^ (self gFileMonitorFile: aGFile flags: aFlags) initialize
]

{ #category : 'operations' }
GFileMonitor >> cancel [
	"Cancels this file monitor."

	^ self ffiCall: #(gboolean g_file_monitor_cancel (self))
]

{ #category : 'signals' }
GFileMonitor >> connectChanged: aBlock [
	"Connect to the 'changed' signal.
	 aBlock receives three arguments: aGFile, otherGFile, eventType.
	 - aGFile: the GFile that changed
	 - otherGFile: the other GFile (for move/rename events, nil otherwise)
	 - eventType: a GFileMonitorEvent indicating what happened"

	^ self
		  connect: 'changed'
		  signature: #( void (void *monitor, void *file, void *other_file, int event_type, void* user_data ) )
		  do: [ :monitor :file :other_file :event_type :user_data |
				  aBlock
					  value: (file isNull ifFalse: [ GFile fromHandleUnowned: file ])
					  value: (other_file isNull ifFalse: [ GFile fromHandleUnowned: other_file ])
					  value: (GFileMonitorEvent fromInteger: event_type) ]
]

{ #category : 'testing' }
GFileMonitor >> isCancelled [
	"Returns whether the monitor is cancelled."

	^ self ffiCall: #(gboolean g_file_monitor_is_cancelled (self))
]

{ #category : 'accessing' }
GFileMonitor >> rateLimit: anInteger [
	"Sets the rate limit in milliseconds for consecutive change events to the same file."

	^ self ffiCall: #(void g_file_monitor_set_rate_limit (self, gint anInteger))
]
