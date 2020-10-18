Extension { #name : #KMCtrlModifier }

{ #category : #'*Gtk' }
KMCtrlModifier >> asGdkModifierType [ 

	^ GdkModifierType GDK_CONTROL_MASK
]
