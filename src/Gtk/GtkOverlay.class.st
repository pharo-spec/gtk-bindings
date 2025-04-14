"
GtkOverlay — A container which overlays widgets on top of each other

https://developer.gnome.org/gtk3/stable/GtkOverlay.html
"
Class {
	#name : 'GtkOverlay',
	#superclass : 'GtkWidget',
	#traits : 'GtkTContainer + GtkTBin',
	#classTraits : 'GtkTContainer classTrait + GtkTBin classTrait',
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'accessing' }
GtkOverlay class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_overlay_get_type())
]

{ #category : 'instance  creation' }
GtkOverlay class >> new [

	^ self overlayNew initialize
]

{ #category : 'private' }
GtkOverlay class >> overlayNew [

	^ self ffiCall: #(GtkOverlay *gtk_overlay_new  (void))
]

{ #category : 'accessing' }
GtkOverlay >> addOverlay: aWidget [

	self keepWidget: aWidget.
	self basicAddOverlay: aWidget
]

{ #category : 'private' }
GtkOverlay >> basicAddOverlay: aWidget [

	^ self ffiCall: #(void gtk_overlay_add_overlay (self, GtkWidget *aWidget))
]

{ #category : 'private' }
GtkOverlay >> basicRemove: widget [

	self ffiCall: #(void gtk_overlay_remove_overlay (self, GtkWidget* widget))

]

{ #category : 'private' }
GtkOverlay >> cleanupAfterReplacing [

	"child"
	child ifNotNil: [ 
		child cleanupAfterReplacing.
		child := nil ].
	"container"
	self children 
		do: [ :aChild | aChild cleanupAfterReplacing ].
	children := #()
]

{ #category : 'private' }
GtkOverlay >> findChildByHandle: anExternalAddress [

	(anExternalAddress isNil or: [ anExternalAddress isNull ]) ifTrue: [ ^ nil ].
	child getHandle = anExternalAddress ifTrue: [ ^ child ].
	^ children detect: [ :each | each getHandle = anExternalAddress ]
]

{ #category : 'testing' }
GtkOverlay >> hasChildren [

	^ child notNil or: [ self children notEmpty ]
]

{ #category : 'testing' }
GtkOverlay >> includes: aWidget [

	^ aWidget = child 
		or: [ self children includes: aWidget ]
]

{ #category : 'initialization' }
GtkOverlay >> initialize [

	super initialize.
	self initializeTContainer.
	"self initializeTBin"
]

{ #category : 'accessing' }
GtkOverlay >> removeAll [

	self removeChild.
	self removeAllContainer
]

{ #category : 'private' }
GtkOverlay >> setChild: aWidget [

	self ffiCall: #(void gtk_overlay_set_child (self, GtkWidget* child))
]

{ #category : 'accessing' }
GtkOverlay >> setOverlayPassThrougth: boolean child: aChild [

	self deprecated: #Gtk4
]

{ #category : 'private - deferring' }
GtkOverlay >> withAllChildrenDo: aBlock [

	aBlock cull: self.
	aBlock cull: child.
	self children do: [ :each |
		each withAllChildrenDo: aBlock ]
]
