"
GSimpleActionGroup is a hash table filled with GAction objects, implementing the GActionGroup and GActionMap interfaces.

https://docs.gtk.org/gio/class.SimpleActionGroup.html
"
Class {
	#name : #GSimpleActionGroup,
	#superclass : #GObject,
	#traits : 'GdkTLibrary + GTActionGroup',
	#classTraits : 'GdkTLibrary classTrait + GTActionGroup classTrait',
	#instVars : [
		'actions'
	],
	#category : #'Gtk-Widget-Menu'
}

{ #category : #private }
GSimpleActionGroup class >> gNew [

	^ self ffiCall: #(GSimpleActionGroup* g_simple_action_group_new (void))
]

{ #category : #'instance creation' }
GSimpleActionGroup class >> new [

	^ self gNew initialize
]

{ #category : #private }
GSimpleActionGroup >> basicInsert: action [

	self ffiCall: #(void g_simple_action_group_insert (self, "GAction"GObject* action))
]

{ #category : #private }
GSimpleActionGroup >> basicRemove: action_name [

	^ self ffiCall: #(void g_simple_action_group_remove (self, const gchar* action_name))
]

{ #category : #initialization }
GSimpleActionGroup >> initialize [

	super initialize.
	actions := OrderedCollection new
]

{ #category : #accessing }
GSimpleActionGroup >> insert: anAction [

	self keepAction: anAction.
	self basicInsert: anAction.
	anAction doNotAutoRelease
]

{ #category : #private }
GSimpleActionGroup >> keepAction: anAction [

	actions add: anAction
]

{ #category : #accessing }
GSimpleActionGroup >> lookup: action_name [
	"No need to go through the lookup of gtk4"

	^ actions 
		detect: [ :each | each name = action_name ]
		ifNone: [ nil ]
]

{ #category : #accessing }
GSimpleActionGroup >> remove: anAction [

	self basicRemove: anAction name.
	actions remove: anAction
]

{ #category : #accessing }
GSimpleActionGroup >> removeNamed: aName [

	self remove: (self lookup: aName)
]
