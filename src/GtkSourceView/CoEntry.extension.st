Extension { #name : 'CoEntry' }

{ #category : '*GtkSourceView' }
CoEntry >> icon [
	| completion |
	
	completion := self contents.
	completion first isUppercase ifTrue: [ 
		Smalltalk globals 
			at: completion
			ifPresent: [ :aGlobal | ^ self iconNamed: aGlobal systemIconName ] ].
	
	^ nil
]
