"
GtkSourceView needs to be initialized.
"
Class {
	#name : #GtkSourceEngineSupport,
	#superclass : #GtkEngineSupport,
	#category : #'GtkSourceView-Base'
}

{ #category : #testing }
GtkSourceEngineSupport class >> isAvailable [

	^ true
]

{ #category : #accessing }
GtkSourceEngineSupport >> start [

	GtkSourceViewLibrary uniqueInstance init
]
