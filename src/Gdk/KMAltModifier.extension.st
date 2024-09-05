Extension { #name : 'KMAltModifier' }

{ #category : '*Gdk' }
KMAltModifier >> asGdkModifierType [ 
	
	self flag: #TODO. "This is wrong"
	^ GdkModifierType GDK_SUPER_MASK
]
