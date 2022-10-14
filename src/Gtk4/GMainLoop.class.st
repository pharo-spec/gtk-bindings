Class {
	#name : #GMainLoop,
	#superclass : #GBaseObject,
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#category : #Gtk4
}

{ #category : #private }
GMainLoop class >> gNew [

	^ self ffiCall: #(GMainLoop* g_main_loop_new (NULL, gboolean false))
]

{ #category : #private }
GMainLoop class >> gNew: context [

	^ self ffiCall: #(GMainLoop* g_main_loop_new (GMainContext *context, gboolean false))
]

{ #category : #'instance creation' }
GMainLoop class >> new [

	^ self gNew initialize
]

{ #category : #'instance creation' }
GMainLoop class >> newDefault [

	^ (self gNew: GMainContext default) initialize
]

{ #category : #testing }
GMainLoop >> isRunning [

	^ self ffiCall: #(gboolean g_main_loop_is_running (self))
]

{ #category : #running }
GMainLoop >> quit [

	self ffiCall: #(void g_main_loop_quit (self))
]

{ #category : #running }
GMainLoop >> run [

	self ffiCall: #(void g_main_loop_run (self))
]
