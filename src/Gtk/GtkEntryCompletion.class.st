Class {
	#name : #GtkEntryCompletion,
	#superclass : #GtkStructure,
	#category : #'Gtk-Misc'
}

{ #category : #'field definition' }
GtkEntryCompletion class >> fieldsDesc [
	"self rebuildFieldAccessors" 
	^ #(

	)
]

{ #category : #'field definition' }
GtkEntryCompletion class >> newCompletion [

	^ self ffiCall: #(GtkEntryCompletion *gtk_entry_completion_new ( void ))
]

{ #category : #initialization }
GtkEntryCompletion >> setMatchFunc: func [

	^ self ffiCall: #(void gtk_entry_completion_set_match_func (self, FFICallback func, nil, nil))
]

{ #category : #initialization }
GtkEntryCompletion >> setModel: model [

	^ self ffiCall: #(void  gtk_entry_completion_set_model  ( void, void * model))
]

{ #category : #initialization }
GtkEntryCompletion >> setTextColumn: column [

	^ self ffiCall: #(void gtk_entry_completion_set_text_column (self, gint column))
]
