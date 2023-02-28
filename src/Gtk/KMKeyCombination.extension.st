Extension { #name : #KMKeyCombination }

{ #category : #'*Gtk' }
KMKeyCombination >> asGtkShortcut [

	| charValue modifiers |
	charValue := self platformCharacter asciiValue.
	modifiers := self platformModifier asGdkModifierType.

	^ GtkShortcut new
		trigger: (GtkKeyvalTrigger newKeyval: charValue modifiers: modifiers);
		action: [  ];
		yourself
]
