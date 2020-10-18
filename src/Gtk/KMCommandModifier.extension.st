Extension { #name : #KMCommandModifier }

{ #category : #'*Gtk' }
KMCommandModifier >> asGdkModifierType [ 

	self flag: #TODO. "This is wrong"	
	^ GdkModifierType GDK_META_MASK
]
