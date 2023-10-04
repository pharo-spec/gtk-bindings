"
https://docs.gtk.org/gtk4/class.DropDown.html
"
Class {
	#name : #GtkDropDown,
	#superclass : #GtkWidget,
	#instVars : [
		'listFactory',
		'model',
		'expression'
	],
	#category : #'Gtk-Widget-Input'
}

{ #category : #private }
GtkDropDown class >> gtkNew [

	^ self ffiCall: #(GtkDropDown *gtk_drop_down_new (NULL, NULL))
]

{ #category : #'instance creation' }
GtkDropDown class >> new [

	^ self gtkNew initialize
]

{ #category : #'instance creation' }
GtkDropDown class >> newListFactory: aFactory Model: aModel [

	^ self new
		listFactory: aFactory;
		model: aModel;
		yourself
]

{ #category : #signaling }
GtkDropDown >> connectSelectedItem: aBlock [

	self 
		connect: 'notify::selected-item' 
		signature: #(void (void *widget)) 
		do: [ :widget | aBlock value ]
]

{ #category : #accessing }
GtkDropDown >> expression: anExpression [

	expression := anExpression.
	self setExpression: anExpression.
	expression objectUnref
]

{ #category : #private }
GtkDropDown >> getModel [

	^ self ffiCall: #(GListModel* gtk_drop_down_get_model (self))
]

{ #category : #accessing }
GtkDropDown >> listFactory: factory [

	listFactory := factory.
	self setListFactory: factory.
	factory ensureAutoRelease
]

{ #category : #accessing }
GtkDropDown >> model [

	^ model ifNil: [ model := self getModel ]
]

{ #category : #accessing }
GtkDropDown >> model: aModel [

	model := aModel.
	self setModel: aModel.
	model doNotAutoRelease.
	model objectUnref
]

{ #category : #accessing }
GtkDropDown >> select: position [

	self ffiCall: #(void gtk_drop_down_set_selected (self, guint position))
]

{ #category : #accessing }
GtkDropDown >> selected [

	^ self ffiCall: #(guint gtk_drop_down_get_selected (self))
]

{ #category : #initialization }
GtkDropDown >> setExpression: anExpression [

	self ffiCall: #(void gtk_drop_down_set_expression (self, GtkExpression* anExpression))
]

{ #category : #private }
GtkDropDown >> setListFactory: aFactory [

	self ffiCall: #(void gtk_drop_down_set_list_factory (
  		self,
  		GtkListItemFactory *aFactory))
]

{ #category : #private }
GtkDropDown >> setModel: aModel [

	^ self ffiCall: #(void gtk_drop_down_set_model (self, GListModel *aModel))
]

{ #category : #accessing }
GtkDropDown >> unselectAll [

	self select: "GTK_INVALID_LIST_POSITION"16rFFFFFFFF
]
