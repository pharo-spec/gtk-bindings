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

{ #category : #accessing }
GtkDropDown >> expression: anExpression [

	expression := anExpression.
	self setExpression: anExpression
]

{ #category : #accessing }
GtkDropDown >> listFactory: factory [

	listFactory := factory.
	self setListFactory: factory
]

{ #category : #accessing }
GtkDropDown >> model: aModel [

	model := aModel.
	self setModel: aModel
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

	^ self ffiCall: #(void gtk_drop_down_set_model (self, "GListModel"GListStore *aModel))
]
