Extension { #name : #KMShiftModifier }

{ #category : #'*Gtk' }
KMShiftModifier >> asGdkModifierType [ 

	^ GdkModifierType GDK_SHIFT_MASK
]
