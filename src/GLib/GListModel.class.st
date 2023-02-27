"
https://docs.gtk.org/gio/iface.ListModel.html

THIS IS A CONCRETE IMPLEMENTATION OF THE INTERFACE.
Some gtk4 functions answer a GListModel instance (hidding its concrete type).
This class is useful to access those results.
The real interface is defined in `GListModelIface`.
Concrete types are defined in `GListStore` hierarchy.
"
Class {
	#name : #GListModel,
	#superclass : #GObject,
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#instVars : [
		'type'
	],
	#category : #'GLib-Lists'
}

{ #category : #'instance creation' }
GListModel class >> new [

	self error: 'This is an abstract type, it will be provided by some functions. Use GListStore hierarchy instead.'
]

{ #category : #converting }
GListModel >> asArray [

	^ Array streamContents: [ :stream |
		self do: [ :each | stream nextPut: each ] ]
]

{ #category : #private }
GListModel >> classToUse [

	^ type ifNil: [ GObject ]
]

{ #category : #enumerating }
GListModel >> do: aBlock [
	| classToUse |

	classToUse := self classToUse.
	0 to: (self numberOfItems - 1) do: [ :index |
		aBlock value: (classToUse fromHandleUnreferenced: (self itemAt: index)) ]
]

{ #category : #accessing }
GListModel >> itemAt: position [

	^ self ffiCall: #(gpointer g_list_model_get_item (self, guint position))
]

{ #category : #accessing }
GListModel >> itemType [

	^ self ffiCall: #(GType g_list_model_get_item_type (self))
]

{ #category : #accessing }
GListModel >> itemsChangedAt: position removed: removed added: added [

	^ self ffiCall: #(void g_list_model_items_changed (self,
  guint position,
  guint removed,
  guint added))
]

{ #category : #accessing }
GListModel >> numberOfItems [

	^ self ffiCall: #(guint g_list_model_get_n_items (self))
]

{ #category : #accessing }
GListModel >> objectAt: position [

	^ self ffiCall: #(GObject* g_list_model_get_object (self, guint position))
]

{ #category : #accessing }
GListModel >> objectAt: position as: aClass [
	| itemHandle |

	itemHandle := self itemAt: position.
	^ aClass fromHandleUnreferenced: itemHandle
]

{ #category : #accessing }
GListModel >> ofType: aClass [
	"Used for ennumerations"

	type := aClass
]
