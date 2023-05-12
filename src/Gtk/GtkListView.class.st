"
https://docs.gtk.org/gtk4/class.ListView.html
"
Class {
	#name : #GtkListView,
	#superclass : #GtkWidget,
	#instVars : [
		'factory',
		'selectionModel'
	],
	#category : #'Gtk-Widget-List'
}

{ #category : #private }
GtkListView class >> gtkNewSelectionModel: model factory: factory [


	^ self ffiCall: #(GtkListView *gtk_list_view_new (
		GtkSelectionModel *model, 
		GtkListItemFactory *factory))
	
]

{ #category : #'instance creation' }
GtkListView class >> new [

	^ self
		newFactory: GObject null
		selectionModel: GObject null
]

{ #category : #'instance creation' }
GtkListView class >> newFactory: factory [

	^ self 
		newFactory: factory 
		selectionModel: GObject null
]

{ #category : #'instance creation' }
GtkListView class >> newFactory: aFactory selectionModel: aSelectionModel [

	^ (self gtkNewSelectionModel: aSelectionModel factory: aFactory) 
		initializeFactory: aFactory selectionModel: aSelectionModel;
		yourself

	
]

{ #category : #accessing }
GtkListView >> factory [

	^ factory ifNil: [ factory := self getFactory ]
]

{ #category : #accessing }
GtkListView >> factory: aFactory [

	factory := aFactory.
	self setFactory: aFactory
]

{ #category : #private }
GtkListView >> getFactory [

	^ self ffiCall: #(GtkListItemFactory* gtk_list_view_get_factory (self))
]

{ #category : #private }
GtkListView >> getModel [

	^ self ffiCall: #(GtkSelectionModel* gtk_list_view_get_model (self))
]

{ #category : #initialization }
GtkListView >> initializeFactory: aFactory selectionModel: aSelectionModel [

	aFactory getHandle isNull 
		ifFalse: [ factory := aFactory ].
	aSelectionModel getHandle isNull
		ifFalse: [ selectionModel := aSelectionModel ].
	self initialize
]

{ #category : #accessing }
GtkListView >> model [

	^ selectionModel ifNil: [ selectionModel := self getModel ]
]

{ #category : #accessing }
GtkListView >> model: aModel [

	selectionModel := aModel.
	self setModel: aModel
]

{ #category : #private }
GtkListView >> setFactory: aFactory [

	^ self ffiCall: #(void gtk_list_view_set_factory (
		self,
  		GtkListItemFactory* aFactory))
]

{ #category : #private }
GtkListView >> setModel: model [

	self ffiCall: #(void gtk_list_view_set_model (
		self,
  		GtkSelectionModel* model))
]
