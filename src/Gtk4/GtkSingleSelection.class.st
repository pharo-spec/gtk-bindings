"
https://docs.gtk.org/gtk4/class.SingleSelection.html
"
Class {
	#name : #GtkSingleSelection,
	#superclass : #GtkSelectionModel,
	#instVars : [
		'model'
	],
	#category : #'Gtk4-List'
}

{ #category : #private }
GtkSingleSelection class >> gtkNew: model [

	^ self ffiCall: #(GtkSingleSelection *gtk_single_selection_new ("GListModel*"GObject *model))
]

{ #category : #'instance creation' }
GtkSingleSelection class >> new [

	^ (self gtkNew: GObject null) initialize
]

{ #category : #'instance creation' }
GtkSingleSelection class >> newModel: aModel [

	^ (self gtkNew: aModel) 
		initializeModel: aModel;
		yourself
]

{ #category : #private }
GtkSingleSelection >> getModel [

	^ self ffiCall: #("GListModel*"GObject *gtk_single_selection_get_model (self))
]

{ #category : #initialization }
GtkSingleSelection >> initializeModel: aModel [

	self initialize.
	model := aModel
]

{ #category : #accessing }
GtkSingleSelection >> model [

	^ model ifNil: [ model := self getModel ]
]

{ #category : #accessing }
GtkSingleSelection >> model: aModel [

	model := aModel.
	self setModel: aModel
]

{ #category : #private }
GtkSingleSelection >> setModel: aModel [

	self ffiCall: #(void gtk_single_selection_set_model (
  		self,
  		"GListModel*"GObject *aModel))
]
