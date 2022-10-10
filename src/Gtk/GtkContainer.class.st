"
GtkContainer — Base class for widgets which contain other widgets

https://developer.gnome.org/gtk3/stable/GtkContainer.html
"
Class {
	#name : #GtkContainer,
	#superclass : #GtkWidget,
	#instVars : [
		'children'
	],
	#category : #'Gtk-Widget-Container'
}

{ #category : #accessing }
GtkContainer class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_container_get_type())
]

{ #category : #private }
GtkContainer >> basicRemove: child [

	self subclassResponsibility
]

{ #category : #accessing }
GtkContainer >> children [ 
	^ children
]

{ #category : #private }
GtkContainer >> cleanupAfterReplacing [

	children do: [ :aChild | aChild cleanupAfterReplacing ].
	children := Array new
]

{ #category : #accessing }
GtkContainer >> destroy [
	"Do not let gtk destroy container children. Instead, dereference them and let the regular
	 GC/reference count to act."

	self removeAll.
	super destroy
]

{ #category : #private }
GtkContainer >> findChildByHandle: anExternalAddress [
	| address |

	(anExternalAddress isNil or: [ anExternalAddress isNull ]) ifTrue: [ ^ nil ].
	address := anExternalAddress asInteger.
	^ children detect: [ :each | each getHandle asInteger = address ]
]

{ #category : #testing }
GtkContainer >> hasChildren [

	^ self children notEmpty
]

{ #category : #testing }
GtkContainer >> includes: aWidget [

	^ self children includes: aWidget
]

{ #category : #initialization }
GtkContainer >> initialize [

	super initialize.
	children := #()
]

{ #category : #inspecting }
GtkContainer >> inspectionWidgets [
	<inspectorPresentationOrder: 10 title: 'Widgets'>

	^ SpTreeTablePresenter new
		roots: self children;
		children: [ :each | 
			(each isKindOf: GtkContainer) 
				ifTrue: [ each children ]
				ifFalse: [ #() ] ];
		yourself
]

{ #category : #inspecting }
GtkContainer >> inspectionWidgetsContext: aContext [ 
	
	aContext active: self hasChildren
]

{ #category : #private }
GtkContainer >> keepWidget: widget [

	children := children copyWith: widget


]

{ #category : #accessing }
GtkContainer >> removeAll [
	"remove widgets will also destroy them (since it will not be referenced, unless you 
	 took a reference explicitly, which we are not doing now). 
	 See https://developer.gnome.org/gtk3/stable/GtkContainer.html#gtk-container-remove"
	children do: [ :each | self basicRemove: each ].
	children := #()
]

{ #category : #'private deferring' }
GtkContainer >> withAllChildrenDo: aBlock [

	aBlock cull: self.
	self children do: [ :each |
		each withAllChildrenDo: aBlock ]
]
