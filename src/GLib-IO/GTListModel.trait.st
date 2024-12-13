"
An interface that defines GListModel (since it is used in different parts of the hierarchy)
"
Trait {
	#name : 'GTListModel',
	#instVars : [
		'type'
	],
	#category : 'GLib-IO-Lists',
	#package : 'GLib-IO',
	#tag : 'Lists'
}

{ #category : 'converting' }
GTListModel >> asArray [

	^ Array streamContents: [ :stream |
		self do: [ :each | stream nextPut: each ] ]
]

{ #category : 'private' }
GTListModel >> classToUse [

	^ type ifNil: [ GObject ]
]

{ #category : 'enumerating' }
GTListModel >> do: aBlock [
	| classToUse |

	classToUse := self classToUse.
	0 to: (self numberOfItems - 1) do: [ :index |
		aBlock value: (classToUse fromHandleUnreferenced: (self itemAt: index)) ]
]

{ #category : 'accessing' }
GTListModel >> itemAt: position [

	^ self 
		ffiCall: #(gpointer g_list_model_get_item (self, guint position))
		module: GLibIOLibrary
]

{ #category : 'accessing' }
GTListModel >> itemType [

	^ self 
		ffiCall: #(GType g_list_model_get_item_type (self))
		module: GLibIOLibrary
]

{ #category : 'accessing' }
GTListModel >> itemsChangedAt: position removed: removed added: added [

	^ self 
		ffiCall: #(void g_list_model_items_changed (
			self,
			guint position,
			guint removed,
			guint added))
		module: GLibIOLibrary
]

{ #category : 'accessing' }
GTListModel >> numberOfItems [

	^ self 
		ffiCall: #(guint g_list_model_get_n_items (self))
		module: GLibIOLibrary
]

{ #category : 'accessing' }
GTListModel >> objectAt: position [

	^ self 
		ffiCall: #(GObject* g_list_model_get_object (self, guint position))
		module: GLibIOLibrary
]

{ #category : 'accessing' }
GTListModel >> objectAt: position as: aClass [
	| itemHandle |

	itemHandle := self itemAt: position.
	^ aClass fromHandleUnreferenced: itemHandle
]

{ #category : 'enumerating' }
GTListModel >> ofType: aClass [
	"Used for ennumerations"

	type := aClass
]
