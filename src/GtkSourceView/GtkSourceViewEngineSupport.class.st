"
GtkSourceView needs to be initialized.
"
Class {
	#name : 'GtkSourceViewEngineSupport',
	#superclass : 'GtkEngineSupport',
	#category : 'GtkSourceView-Base',
	#package : 'GtkSourceView',
	#tag : 'Base'
}

{ #category : 'testing' }
GtkSourceViewEngineSupport class >> isAvailable [

	^ GtkSourceViewLibrary uniqueInstance isAvailable
]

{ #category : 'accessing' }
GtkSourceViewEngineSupport >> start [

	GtkSourceViewLibrary uniqueInstance init
]
