"
An util to allow drag&drop transfers without passing through gtk (so I can keep objects).
"
Class {
	#name : 'GtkDragAndDropTransfer',
	#superclass : 'Object',
	#instVars : [
		'#owner => WeakSlot',
		'#passenger => WeakSlot'
	],
	#classVars : [
		'#Current'
	],
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'accessing' }
GtkDragAndDropTransfer class >> get [

	^ Current
]

{ #category : 'accessing' }
GtkDragAndDropTransfer class >> reset [

	Current := nil
]

{ #category : 'initialization' }
GtkDragAndDropTransfer >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : 'accessing' }
GtkDragAndDropTransfer >> owner [

	^ owner
]

{ #category : 'accessing' }
GtkDragAndDropTransfer >> owner: anObject [

	owner := anObject
]

{ #category : 'accessing' }
GtkDragAndDropTransfer >> passenger [

	^ passenger
]

{ #category : 'accessing' }
GtkDragAndDropTransfer >> passenger: anObject [

	passenger := anObject
]

{ #category : 'accessing' }
GtkDragAndDropTransfer >> set [

	Current := self
]
