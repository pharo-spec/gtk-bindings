"
https://docs.gtk.org/gtk4/class.SingleSelection.html
"
Class {
	#name : #GtkSingleSelection,
	#superclass : #GtkSelectionModel,
	#instVars : [
		'model'
	],
	#category : #'Gtk-Widget-ListView'
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

	^ self new
		model: aModel;
		yourself
]

{ #category : #private }
GtkSingleSelection >> cleanModel [

	self ffiCall: #(void gtk_single_selection_set_model (self, NULL))
]

{ #category : #private }
GtkSingleSelection >> getModel [

	^ self ffiCall: #("GListModel*"GObject *gtk_single_selection_get_model (self))
]

{ #category : #accessing }
GtkSingleSelection >> model [

	^ model ifNil: [ model := self getModel ]
]

{ #category : #accessing }
GtkSingleSelection >> model: aModel [

	model := aModel.
	self setModel: aModel.
	"Ensure we do not finalize because we have transmitted the control to the next place."
	aModel doNotAutoRelease
]

{ #category : #accessing }
GtkSingleSelection >> select: position [

	self ffiCall: #(void gtk_single_selection_set_selected (self, guint position))

]

{ #category : #accessing }
GtkSingleSelection >> selected [

	self ffiCall: #(guint gtk_single_selection_get_selected (self))

]

{ #category : #private }
GtkSingleSelection >> setModel: aModel [

	self ffiCall: #(void gtk_single_selection_set_model (
  		self,
  		"GListModel*"GObject *aModel))
]
