Extension { #name : 'KMCommandModifier' }

{ #category : '*Gdk' }
KMCommandModifier >> asGdkModifierType [ 

	self flag: #TODO. "This is wrong"	
	^ GdkModifierType GDK_META_MASK
]
