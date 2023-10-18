"
https://docs.gtk.org/gtk4/class.SingleSelection.html
"
Class {
	#name : 'GtkSingleSelection',
	#superclass : 'GtkSelectionModel',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkSingleSelection class >> gtkNew: model [

	^ self ffiCall: #(GtkSingleSelection *gtk_single_selection_new ("GListModel*"GObject *model))
]

{ #category : 'accessing' }
GtkSingleSelection >> autoSelect: autoselect [
	"this will mark the autoselect of the model. 
	 Notice that for it to have effect, it needs to be set BEFORE the model"
	
	self ffiCall: #(void gtk_single_selection_set_autoselect (self, gboolean autoselect))
]

{ #category : 'private' }
GtkSingleSelection >> basicSelect: position [

	self ffiCall: #(void gtk_single_selection_set_selected (self, guint position))

]

{ #category : 'private' }
GtkSingleSelection >> basicSelected [

	self ffiCall: #(guint gtk_single_selection_get_selected (self))

]

{ #category : 'accessing' }
GtkSingleSelection >> canUnselect: can_unselect [

	self ffiCall: #(void gtk_single_selection_set_can_unselect ( self, gboolean can_unselect))
]

{ #category : 'private' }
GtkSingleSelection >> getModel [

	^ self ffiCall: #("GListModel*"GObject *gtk_single_selection_get_model (self))
]

{ #category : 'testing' }
GtkSingleSelection >> isAutoSelect [

	^ self ffiCall: #(gboolean gtk_single_selection_get_autoselect (self))
]

{ #category : 'accessing' }
GtkSingleSelection >> select: position [

	position < 1 ifTrue: [ ^ self unselectAll ].
	self basicSelect: position - 1
]

{ #category : 'accessing' }
GtkSingleSelection >> selected [

	^ self basicSelected + 1
]

{ #category : 'private' }
GtkSingleSelection >> setModel: aModel [

	self ffiCall: #(void gtk_single_selection_set_model (
  		self,
  		"GListModel*"GObject *aModel))
]
