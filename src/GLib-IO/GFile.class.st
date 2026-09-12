"
https://docs.gtk.org/gio/iface.File.html
"
Class {
	#name : 'GFile',
	#superclass : 'GObject',
	#traits : 'GLibIOTLibrary',
	#classTraits : 'GLibIOTLibrary classTrait',
	#category : 'GLib-IO-Base',
	#package : 'GLib-IO',
	#tag : 'Base'
}

{ #category : 'instance creation' }
GFile class >> forPath: aPath [

	^ (self gNewForPath: aPath) initialize
]

{ #category : 'private' }
GFile class >> gNewForPath: path [

	^ self ffiCall: #(GFile* g_file_new_for_path (const char* path)) module: GLibIOLibrary
]

{ #category : 'initialization' }
GFile >> autoObjectUnref [
	"do not auto object unref GFile: users needs to do it by themselves"
]

{ #category : 'monitoring' }
GFile >> monitorDirectory [
	"Obtains a directory monitor for the directory with no special flags."

	^ GFileMonitor onDirectory: self
]

{ #category : 'monitoring' }
GFile >> monitorDirectoryWithFlags: aFlags [
	"Obtains a directory monitor for the directory with the given GFileMonitorFlags."

	^ GFileMonitor onDirectory: self flags: aFlags
]

{ #category : 'monitoring' }
GFile >> monitorFile [
	"Obtains a file monitor for the file with no special flags."

	^ GFileMonitor onFile: self
]

{ #category : 'monitoring' }
GFile >> monitorFileWithFlags: aFlags [
	"Obtains a file monitor for the file with the given GFileMonitorFlags."

	^ GFileMonitor onFile: self flags: aFlags
]

{ #category : 'accessing' }
GFile >> path [

	^ self ffiCall: #(char* g_file_get_path (self))
]

{ #category : 'accessing' }
GFile >> uri [

	^ self ffiCall: #(char* g_file_get_uri (self))
]
