"
GtkSourceView needs to be initialized.
"
Class {
	#name : #GtkSourceViewEngineSupport,
	#superclass : #GtkEngineSupport,
	#category : #'GtkSourceView-Base'
}

{ #category : #testing }
GtkSourceViewEngineSupport class >> isAvailable [

	^ true
]

{ #category : #accessing }
GtkSourceViewEngineSupport >> start [

	GtkSourceViewLibrary uniqueInstance init
]
