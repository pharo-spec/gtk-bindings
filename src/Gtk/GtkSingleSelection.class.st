"
https://docs.gtk.org/gtk4/class.SingleSelection.html
"
Class {
	#name : #GtkSingleSelection,
	#superclass : #GtkSelectionModel,
	#category : #'Gtk-Widget-ListView'
}

{ #category : #private }
GtkSingleSelection class >> gtkNew: model [

	^ self ffiCall: #(GtkSingleSelection *gtk_single_selection_new ("GListModel*"GObject *model))
]

{ #category : #private }
GtkSingleSelection >> basicSelect: position [

	self ffiCall: #(void gtk_single_selection_set_selected (self, guint position))

]

{ #category : #private }
GtkSingleSelection >> basicSelected [

	self ffiCall: #(guint gtk_single_selection_get_selected (self))

]

{ #category : #private }
GtkSingleSelection >> getModel [

	^ self ffiCall: #("GListModel*"GObject *gtk_single_selection_get_model (self))
]

{ #category : #accessing }
GtkSingleSelection >> select: position [

	position < 1 ifTrue: [ ^ self unselectAll ].
	self basicSelect: position - 1
]

{ #category : #accessing }
GtkSingleSelection >> selected [

	^ self basicSelected + 1
]

{ #category : #private }
GtkSingleSelection >> setModel: aModel [

	self ffiCall: #(void gtk_single_selection_set_model (
  		self,
  		"GListModel*"GObject *aModel))
]
