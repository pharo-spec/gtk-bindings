"
A base to pharo-side based item factories. 
This is an abstract class and users will need to answer to implement: `setup:`, `bind:`, `unbind:` and `teardown:` methods. 
"
Class {
	#name : #GtkPharoListItemFactory,
	#superclass : #GtkListItemFactory,
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#instVars : [
		'parent',
		'function'
	],
	#classInstVars : [
		'gtkListItemFactoryDefinition'
	],
	#category : #'Gtk-Widget-ListView'
}

{ #category : #'class initialization' }
GtkPharoListItemFactory class >> gDefine: gClass [

	gClass 
		parent: GtkListItemFactory;
		classInitialize: [ :gClassHandle |
			self gInitializeClass: (GtkListItemFactoryClass fromHandle: gClassHandle) ]
]

{ #category : #'class initialization' }
GtkPharoListItemFactory class >> gInitializeClass: aDefinition [
	
	"I need to keep it (otherwise callbacks will not be collected)."
	gtkListItemFactoryDefinition := aDefinition.
	aDefinition
		connect: #setup 
			signature: #(void (void *factory, void *item, gboolean bind, void *func, gpointer data)) 
			to: [ :factory :item :bind :func :data |
				(self gInstance: factory) 
					setup: item
						bind: bind
						func: func
						data: data ];
		connect: #teardown 
			signature: #(void (void *factory, void *item, gboolean unbind, void *func, gpointer data)) 
			to: [ :factory :item :unbind :func :data |
				(self gInstance: factory)
					teardown: item 
						unbind: unbind 
						func: func
						data: data ];
		connect: #update 
			signature: #(void (void *factory, void *item, gboolean unbind, gboolean bind, void *func, gpointer data)) 
			to: [ :factory :item :unbind :bind :func :data | 
				(self gInstance: factory)
					update: item 
						unbind: unbind 
						bind: bind 
						func: func
						data: data ]
]

{ #category : #testing }
GtkPharoListItemFactory class >> isAbstract [

	^ self = GtkPharoListItemFactory
]

{ #category : #accessing }
GtkPharoListItemFactory >> bind: item [

	self subclassResponsibility
]

{ #category : #private }
GtkPharoListItemFactory >> execFunction: func with: arguments [

	^ self function 
		withAddress: func 
		invokeWithArguments: arguments
]

{ #category : #private }
GtkPharoListItemFactory >> function [

	^ function ifNil: [ function := self newFunction ]
]

{ #category : #private }
GtkPharoListItemFactory >> listItemClass [

	^ GtkListItem
]

{ #category : #private }
GtkPharoListItemFactory >> newFunction [

	^ GExternalFunction 
		newAddress: nil
		signature: #(void (void *item, void *data))
		library: self ffiLibrary
]

{ #category : #accessing }
GtkPharoListItemFactory >> setup: item [

	self subclassResponsibility
]

{ #category : #'accessing - functions' }
GtkPharoListItemFactory >> setup: itemHandle bind: shouldBind func: func data: data [
	| listItem |

	listItem := self toListItem: itemHandle.
	func isNull ifFalse: [ 
		self execFunction: func with: { itemHandle. data } ].
	self setup: listItem.
	shouldBind ifTrue: [ 
		self bind: listItem ]
]

{ #category : #accessing }
GtkPharoListItemFactory >> teardown: item [

	self subclassResponsibility
]

{ #category : #'accessing - functions' }
GtkPharoListItemFactory >> teardown: item unbind: unbind func: func data: data [
	| listItem |

	listItem := self toListItem: item.
	unbind ifTrue: [ self unbind: listItem ].
	self teardown: listItem.
	func isNull ifFalse: [ 
		self execFunction: func with: { item. data } ]
]

{ #category : #private }
GtkPharoListItemFactory >> toListItem: item [

	^ self listItemClass fromHandleUnreferenced: item
]

{ #category : #accessing }
GtkPharoListItemFactory >> unbind: item [

	self subclassResponsibility
]

{ #category : #'accessing - functions' }
GtkPharoListItemFactory >> update: itemHandle unbind: shouldUnbind bind: shouldBind func: func data: data [
	| listItem |

	listItem := self toListItem: itemHandle.
	"shouldUnbind ifTrue: [ 
		'unbind' crTrace.
		self unbind: listItem ]."
	func isNull ifFalse: [
		self execFunction: func with: { itemHandle. data } ].
	shouldBind ifTrue: [ self bind: listItem ]
]