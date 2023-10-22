"
https://docs.gtk.org/gio/class.Task.html
"
Class {
	#name : 'GTask',
	#superclass : 'GObject',
	#traits : 'GLibIOTLibrary',
	#classTraits : 'GLibIOTLibrary classTrait',
	#category : 'GLib-IO-Task',
	#package : 'GLib-IO',
	#tag : 'Task'
}

{ #category : 'private' }
GTask class >> gNew: source_object cancellable: cancellable readyCallback: callback data: callback_data [ 

	self ffiCall: #(GTask *g_task_new (
		GObject* source_object,
  		"GCancellable*"GObject *cancellable,
  		"GAsyncReadyCallback"GCallback callback,
  		gpointer callback_data))
]

{ #category : 'private' }
GTask class >> gNew: source_object cancellable: cancellable readyCallbackHandle: callback data: callback_data [ 

	self ffiCall: #(GTask *g_task_new (
		GObject* source_object,
  		"GCancellable*"GObject *cancellable,
  		"GAsyncReadyCallback"void *callback,
  		gpointer callback_data))
]

{ #category : 'private' }
GTask class >> gNew: source_object cancellableHandle: cancellable readyCallbackHandle: callback data: callback_data [ 

	self ffiCall: #(GTask *g_task_new (
		GObject* source_object,
  		"GCancellable*"void *cancellable,
  		"GAsyncReadyCallback"void *callback,
  		gpointer callback_data))
]

{ #category : 'instance creation' }
GTask class >> newSource: source_object [

	^ self 
		newSource: source_object 
		cancellable: GObject null 
		readyCallback: GCallback null
		data: ExternalAddress null
]

{ #category : 'instance creation' }
GTask class >> newSource: source_object cancellable: cancellable readyCallback: callback data: callback_data [ 

	^ (self 
		gNew: source_object 
			cancellable: cancellable 
			readyCallback: callback 
			data: callback_data )
		initialize
]

{ #category : 'instance creation' }
GTask class >> newSource: source_object cancellable: cancellable readyCallbackHandle: callback data: callback_data [ 

	^ (self 
		gNew: source_object 
			cancellable: cancellable 
			readyCallbackHandle: callback 
			data: callback_data )
		initialize
]

{ #category : 'instance creation' }
GTask class >> newSource: source_object cancellableHandle: cancellable readyCallbackHandle: callback data: callback_data [ 

	^ (self 
		gNew: source_object 
			cancellableHandle: cancellable 
			readyCallbackHandle: callback 
			data: callback_data )
		initialize
]

{ #category : 'accessing' }
GTask >> propagatePointer: error [

	^ self ffiCall: #(gpointer g_task_propagate_pointer (self, "GError**"void *error))
]

{ #category : 'accessing' }
GTask >> returnBoolean: result [

	self ffiCall: #(void g_task_return_boolean (self, gboolean result))
]

{ #category : 'accessing' }
GTask >> returnPointer: result [

	self ffiCall: #(void g_task_return_pointer (self, gpointer result, NULL))
]
