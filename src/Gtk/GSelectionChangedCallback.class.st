Class {
	#name : 'GSelectionChangedCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'accessing' }
GSelectionChangedCallback class >> signalName [

	^ 'selection-changed'
]

{ #category : 'accessing' }
GSelectionChangedCallback >> do: aBlock [ 

	^ super do: [ :widget :position :n_items :user_data |
		"gtk is zero based, pharo is 1 based" 
		aBlock 
			value: (position + 1) 
			value: n_items ]
]

{ #category : 'accessing' }
GSelectionChangedCallback >> signature [

	^ #(void (void* widget, guint position, guint n_items, gpointer user_data))
]
