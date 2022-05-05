Extension { #name : #CairoLibrary }

{ #category : #'*Gtk' }
CairoLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'*Gtk' }
CairoLibrary >> runner [
	
	^ TFSameThreadRunner uniqueInstance
]
