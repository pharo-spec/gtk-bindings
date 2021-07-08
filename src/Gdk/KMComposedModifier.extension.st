Extension { #name : #KMComposedModifier }

{ #category : #'*Gdk' }
KMComposedModifier >> asGdkModifierType [ 
	
	^ (self modifiers collect: #asGdkModifierType) sum
]
