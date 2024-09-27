"
[https://developer.gnome.org/gio/stable/GApplication.html](https://developer.gnome.org/gio/stable/GApplication.html)
"
Class {
	#name : 'GApplication',
	#superclass : 'GObject',
	#traits : 'GLibIOTLibrary',
	#classTraits : 'GLibIOTLibrary classTrait',
	#pools : [
		'GApplicationFlags'
	],
	#category : 'Gdk-Application',
	#package : 'Gdk',
	#tag : 'Application'
}

{ #category : 'instance creation' }
GApplication class >> default [

	^ self gDefault initialize 
]

{ #category : 'private' }
GApplication class >> gApplicationNew: application_id flags: flags [

	^ self ffiCall: #(GApplication *g_application_new (
		const gchar *application_id, 
		GApplicationFlags flags))
]

{ #category : 'private' }
GApplication class >> gDefault [

	^ self ffiCall: #(GApplication *g_application_get_default (void))
]

{ #category : 'instance creation' }
GApplication class >> new [ 

	^ self newFlags: G_APPLICATION_DEFAULT_FLAGS
]

{ #category : 'instance creation' }
GApplication class >> newFlags: flags [

	^ self newName: UUID new asString36 flags: flags
]

{ #category : 'instance creation' }
GApplication class >> newName: aName flags: flags [

	^ (self gApplicationNew: aName flags: flags) initialize
]

{ #category : 'signaling' }
GApplication >> connectActivate: aBlock [

	(GActivateApplicationCallback do: aBlock) connectTo: self
]

{ #category : 'private - primitives' }
GApplication >> gRun [
	
	^ self ffiCall: #(int g_application_run (self, int 0, NULL))
]

{ #category : 'accessing' }
GApplication >> register [

	^ self ffiCall: #(gboolean g_application_register (
		self,
		"GCancellable *cancellable"NULL,
		"GError **error"NULL))
]

{ #category : 'accessing' }
GApplication >> sendNotification: notification [

	^ self ffiCall: #(void g_application_send_notification (
		self,
		"const gchar *id"NULL,
		GNotification *notification))
]
