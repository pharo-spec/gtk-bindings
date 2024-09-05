Extension { #name : 'NECEntry' }

{ #category : '*GtkSourceView' }
NECEntry >> icon [
	| completion |
	
	completion := self contents.
	completion first isUppercase ifTrue: [ 
		Smalltalk globals 
			at: completion
			ifPresent: [ :aGlobal | ^ self iconNamed: aGlobal systemIconName ] ].
	
	^ nil
]
