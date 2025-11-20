Trait {
	#name : 'GtkTContainer',
	#instVars : [
		'children'
	],
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'private' }
GtkTContainer >> basicRemove: child [

	self shouldBeImplemented
]

{ #category : 'accessing' }
GtkTContainer >> children [ 

	^ children ifNil: [ #() ]
]

{ #category : 'private' }
GtkTContainer >> cleanupAfterReplacing [

	self children do: [ :aChild | aChild cleanupAfterReplacing ].

	children := #()
]

{ #category : 'private' }
GtkTContainer >> findChildByHandle: anExternalAddress [
	| address |

	(anExternalAddress isNil or: [ anExternalAddress isNull ]) ifTrue: [ ^ nil ].
	address := anExternalAddress asInteger.
	^ self children detect: [ :each | each getHandle asInteger = address ]
]

{ #category : 'testing' }
GtkTContainer >> hasChildren [

	^ self children notEmpty
]

{ #category : 'testing' }
GtkTContainer >> includes: aWidget [

	^ self children includes: aWidget
]

{ #category : 'initialization' }
GtkTContainer >> initialize [

	super initialize.
	self initializeTContainer
]

{ #category : 'initialization' }
GtkTContainer >> initializeTContainer [

	children := #()
]

{ #category : 'inspecting' }
GtkTContainer >> inspectionWidgets: aBuilder [
	<inspectorPresentationOrder: 10 title: 'Widgets'>

	^ aBuilder newTreeTable
		addStyle: 'stList';
		roots: self children;
		children: [ :each | 
			each isContainer 
				ifTrue: [ each children ]
				ifFalse: [ #() ] ];
		yourself
]

{ #category : 'inspecting' }
GtkTContainer >> inspectionWidgetsContext: aContext [ 
	
	aContext active: self hasChildren
]

{ #category : 'testing' }
GtkTContainer >> isContainer [

	^ true
]

{ #category : 'private' }
GtkTContainer >> keepWidget: widget [

	children := self children copyWith: widget
]

{ #category : 'accessing' }
GtkTContainer >> remove: widget [
	"remove widgets will also destroy them (since it will not be referenced, unless you 
	 took a reference explicitly, which we are not doing now). 
	 See https://developer.gnome.org/gtk3/stable/GtkContainer.html#gtk-container-remove"
	
	self basicRemove: widget.
	children := children copyWithout: widget
]

{ #category : 'accessing' }
GtkTContainer >> removeAll [
	"remove widgets will also destroy them (since it will not be referenced, unless you 
	 took a reference explicitly, which we are not doing now). 
	 See https://developer.gnome.org/gtk3/stable/GtkContainer.html#gtk-container-remove"

	children do: [ :each | self basicRemove: each ].
	children := #()
]

{ #category : 'private - deferring' }
GtkTContainer >> withAllChildrenDo: aBlock [

	aBlock cull: self.
	self children do: [ :each |
		each withAllChildrenDo: aBlock ]
]
