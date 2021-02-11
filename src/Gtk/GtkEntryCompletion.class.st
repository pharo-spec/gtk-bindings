Class {
	#name : #GtkEntryCompletion,
	#superclass : #GObject,
	#category : #'Gtk-Misc'
}

{ #category : #private }
GtkEntryCompletion class >> entry_completion_new [

	^ self ffiCall: #(GtkEntryCompletion *gtk_entry_completion_new ( void ))
]

{ #category : #'as yet unclassified' }
GtkEntryCompletion class >> new [
	
	^ self entry_completion_new initialize
]

{ #category : #accessing }
GtkEntryCompletion >> matchFunction: aFunction [ 

	matchFunctionCallback := aFunction.
	self setMatchFunc: aFunction getHandle
]

{ #category : #accessing }
GtkEntryCompletion >> model: aModel [

	model := aModel.
	self setModel: aModel
]

{ #category : #private }
GtkEntryCompletion >> setMatchFunc: func [

	^ self ffiCall: #(void gtk_entry_completion_set_match_func (self, void *func, NULL, NULL))
]

{ #category : #initialization }
GtkEntryCompletion >> setModel: model [

	^ self ffiCall: #(void  gtk_entry_completion_set_model  ( self, void * model))
]

{ #category : #accessing }
GtkEntryCompletion >> textColumn: column [

	^ self ffiCall: #(void gtk_entry_completion_set_text_column (self, gint column))
]
