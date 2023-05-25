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
	#category : #'Gtk-Widget-ListView'
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

{ #category : #initialization }
GtkListView >> autoObjectUnref [
	"I need to do a clean up before this object is disposed. For that reason, unlike a 
	 regular widget (which is freed along with the window), I increment the reference count 
	 and mark the object for autorelease. This will ensure the `finalize` method is called 
	 and the clean up can be done."
	
	self objectRef.
	self autoRelease
]

{ #category : #private }
GtkListView >> clearModel [

	self ffiCall: #(void gtk_list_view_set_model (self, NULL))
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

{ #category : #finalization }
GtkListView >> finalize [
	"Clean up the model before release to avoid an attempt to cleanup of an object that will 
	 probably no longer exist in image-side (we will do the cleanup ourselves, see for example 
	 finalize method on GListReferenceStore (a GtkSelectionModel contains a store)"	
	
	selectionModel ifNotNil: [ 
		selectionModel cleanModel ].
	super finalize.
	"self getHandle printToStdout."
	"GRunLoop defer: [
		self clearModel.
		super finalize ]"
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

{ #category : #testing }
GtkListView >> isSingleClickActivate [

	^ self ffiCall: #(gboolean gtk_list_view_get_single_click_activate (self))
]

{ #category : #accessing }
GtkListView >> selectionModel [

	^ selectionModel ifNil: [ selectionModel := self getModel ]
]

{ #category : #accessing }
GtkListView >> selectionModel: aModel [

	selectionModel ifNotNil: [
		selectionModel cleanModel ].

	selectionModel := aModel.
	self setModel: aModel.
	"apparently, we do not need to autorelease as setting the model will clear any existing 
	 model (and it will be destroyed along with the list view when it is disposed)"
	aModel doNotAutoRelease
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

{ #category : #accessing }
GtkListView >> singleClickActivate: single_click_activate [

	self ffiCall: #(void gtk_list_view_set_single_click_activate (
		self,
  		gboolean single_click_activate))



]
