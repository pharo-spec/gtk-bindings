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

{ #category : 'accessing' }
GFile >> path [

	^ self ffiCall: #(char* g_file_get_path (self))
]

{ #category : 'accessing' }
GFile >> uri [

	^ self ffiCall: #(char* g_file_get_uri (self))
]
