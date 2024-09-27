Extension { #name : 'KMAltModifier' }

{ #category : '*Gdk' }
KMAltModifier >> asGdkModifierType [ 
	
	self flag: #TODO. "This may be wrong in other platforms than linux"
	^ GdkModifierType GDK_MOD1_MASK 
]
