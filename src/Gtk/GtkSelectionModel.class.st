"
https://docs.gtk.org/gtk4/iface.SelectionModel.html
"
Class {
	#name : #GtkSelectionModel,
	#superclass : #GObject,
	#traits : 'GtkTLibrary + GtkTSectionModel',
	#classTraits : 'GtkTLibrary classTrait + GtkTSectionModel classTrait',
	#instVars : [
		'model'
	],
	#category : #'Gtk-Widget-ListView'
}

{ #category : #private }
GtkSelectionModel class >> gtkNew: model [

	self subclassResponsibility
]

{ #category : #'instance creation' }
GtkSelectionModel class >> new [

	^ (self gtkNew: GObject null) initialize
]

{ #category : #'instance creation' }
GtkSelectionModel class >> newModel: aModel [

	^ self new
		model: aModel;
		yourself
]

{ #category : #accessing }
GtkSelectionModel >> allSelected [
	| bitset selected |
	
	bitset := self getSelection.
	selected := bitset iterator collect: [ :each | each + 1 ].
	bitset unref.
	^ selected
]

{ #category : #private }
GtkSelectionModel >> basicIsSelected: position [

	^ self ffiCall: #(gboolean gtk_selection_model_is_selected (self, guint position))
]

{ #category : #private }
GtkSelectionModel >> basicSelectItem: position unselectRest: unselect_rest [

	self ffiCall: #(gboolean gtk_selection_model_select_item (
		self,
  		guint position,
  		gboolean unselect_rest))
]

{ #category : #private }
GtkSelectionModel >> basicUnselectItem: position [ 

	self ffiCall: #(gboolean gtk_selection_model_unselect_item (self, guint position))
]

{ #category : #private }
GtkSelectionModel >> cleanModel [

	self ffiCall: #(void gtk_single_selection_set_model (self, NULL))
]

{ #category : #signaling }
GtkSelectionModel >> connectSelectionChanged: aBlock [
	"aBlock receives two arguments: position, n_items"

	(GSelectionChangedCallback do: aBlock) connectTo: self	
]

{ #category : #private }
GtkSelectionModel >> getModel [

	self subclassResponsibility
]

{ #category : #private }
GtkSelectionModel >> getSelection [

	^ self ffiCall: #(GtkBitset* gtk_selection_model_get_selection (self))
]

{ #category : #accessing }
GtkSelectionModel >> isSelected: position [

	position = 0 ifTrue: [ ^ false ].
	^ self basicIsSelected: position - 1
]

{ #category : #accessing }
GtkSelectionModel >> model [

	^ model ifNil: [ model := self getModel ]
]

{ #category : #accessing }
GtkSelectionModel >> model: aModel [

	model := aModel.
	self setModel: aModel.
	"Ensure we do not finalize because we have transmitted the control to the next place."
	aModel doNotAutoRelease
]

{ #category : #accessing }
GtkSelectionModel >> selectAll [

	^ self ffiCall: #(gboolean gtk_selection_model_select_all (self))
]

{ #category : #accessing }
GtkSelectionModel >> selectItem: position unselectRest: unselect_rest [

	position < 1 ifTrue: [ ^ false ].
	^ self
		basicSelectItem: position - 1
		unselectRest: unselect_rest
]

{ #category : #private }
GtkSelectionModel >> setModel: aListModel [

	self subclassResponsibility
]

{ #category : #accessing }
GtkSelectionModel >> unselectAll [

	^ self ffiCall: #(gboolean gtk_selection_model_unselect_all (self))



]

{ #category : #accessing }
GtkSelectionModel >> unselectItem: position [

	position < 1 ifTrue: [ ^ false ].
	^ self basicUnselectItem: position - 1
]
