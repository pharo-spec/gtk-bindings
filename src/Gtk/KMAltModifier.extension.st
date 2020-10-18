Extension { #name : #KMAltModifier }

{ #category : #'*Gtk' }
KMAltModifier >> asGdkModifierType [ 
	
	self flag: #TODO. "This is wrong"
	^ GdkModifierType GDK_SUPER_MASK
]
