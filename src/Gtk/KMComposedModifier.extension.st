Extension { #name : #KMComposedModifier }

{ #category : #'*Gtk' }
KMComposedModifier >> asGdkModifierType [ 
	
	^ (self modifiers collect: #asGdkModifierType) sum
]
