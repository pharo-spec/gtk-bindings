"
https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/iface.CompletionProposal.html
"
Class {
	#name : 'GtkSourceCompletionProviderIface',
	#superclass : 'GInterface',
	#instVars : [
		'activate',
		'display',
		'get_priority',
		'get_title',
		'is_trigger',
		'key_activates',
		'list_alternates',
		'populate',
		'populate_async',
		'populate_finish',
		'refilter'
	],
	#classVars : [
		'OFFSET_ACTIVATE',
		'OFFSET_DISPLAY',
		'OFFSET_GET_PRIORITY',
		'OFFSET_GET_TITLE',
		'OFFSET_IS_TRIGGER',
		'OFFSET_KEY_ACTIVATES',
		'OFFSET_LIST_ALTERNATES',
		'OFFSET_POPULATE',
		'OFFSET_POPULATE_ASYNC',
		'OFFSET_POPULATE_FINISH',
		'OFFSET_REFILTER'
	],
	#category : 'GtkSourceView-Completion',
	#package : 'GtkSourceView',
	#tag : 'Completion'
}

{ #category : 'field definition' }
GtkSourceCompletionProviderIface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	GCallback get_title;
	GCallback get_priority;
	GCallback is_trigger;
	GCallback key_activates;
	GCallback populate;
	GCallback populate_async;
	GCallback populate_finish;
	GCallback refilter;
	GCallback display;
	GCallback activate;
	GCallback list_alternates;
	)
]

{ #category : 'accessing' }
GtkSourceCompletionProviderIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize gtk_source_completion_provider_get_type())
		module: GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceCompletionProviderIface class >> rebuildFieldAccessors [
	"Prevent rebuild"
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> activate [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ACTIVATE) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> activate: aCallback [
	"This method was automatically generated"
	activate := aCallback.
	handle
		pointerAt: OFFSET_ACTIVATE
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> display [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_DISPLAY) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> display: aCallback [
	"This method was automatically generated"
	display := aCallback.
	handle
		pointerAt: OFFSET_DISPLAY
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> get_priority [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PRIORITY) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> get_priority: aCallback [
	"This method was automatically generated"
	get_priority := aCallback.
	handle
		pointerAt: OFFSET_GET_PRIORITY
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> get_title [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_TITLE) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> get_title: aCallback [
	"This method was automatically generated"
	get_title := aCallback.
	handle
		pointerAt: OFFSET_GET_TITLE
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> is_trigger [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_IS_TRIGGER) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> is_trigger: aCallback [
	"This method was automatically generated"
	is_trigger := aCallback.
	handle
		pointerAt: OFFSET_IS_TRIGGER
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> key_activates [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_KEY_ACTIVATES) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> key_activates: aCallback [
	"This method was automatically generated"
	key_activates := aCallback.
	handle
		pointerAt: OFFSET_KEY_ACTIVATES
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> list_alternates [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_LIST_ALTERNATES) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> list_alternates: aCallback [
	"This method was automatically generated"
	list_alternates := aCallback.
	handle
		pointerAt: OFFSET_LIST_ALTERNATES
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> populate [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_POPULATE) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> populate: aCallback [
	"This method was automatically generated"
	populate := aCallback.
	handle
		pointerAt: OFFSET_POPULATE
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> populate_async [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_POPULATE_ASYNC) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> populate_async: aCallback [
	"This method was automatically generated"
	populate_async := aCallback.
	handle
		pointerAt: OFFSET_POPULATE_ASYNC
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> populate_finish [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_POPULATE_FINISH) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> populate_finish: aCallback [
	"This method was automatically generated"
	populate_finish := aCallback.
	handle
		pointerAt: OFFSET_POPULATE_FINISH
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> refilter [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_REFILTER) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkSourceCompletionProviderIface >> refilter: aCallback [
	"This method was automatically generated"
	refilter := aCallback.
	handle
		pointerAt: OFFSET_REFILTER
		put: (aCallback
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
