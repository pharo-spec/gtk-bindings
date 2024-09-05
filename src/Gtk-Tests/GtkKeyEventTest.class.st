Class {
	#name : 'GtkKeyEventTest',
	#superclass : 'TestCase',
	#pools : [
		'GdkKeyCodes'
	],
	#category : 'Gtk-Tests-Events',
	#package : 'Gtk-Tests',
	#tag : 'Events'
}

{ #category : 'testing' }
GtkKeyEventTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkKeyEventTest ]
]

{ #category : 'accessing' }
GtkKeyEventTest >> classToTest [

	^ self subclassResponsibility
]

{ #category : 'tests' }
GtkKeyEventTest >> newFromCharacter: aCharacter [

	^ self classToTest 
		newCharacter: $x
		shift: false 
		meta: false 
		control: false 
		option: false
]

{ #category : 'tests' }
GtkKeyEventTest >> newFromCharacter: aCharacter shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	^ self classToTest 
		newCharacter: aCharacter
		shift: shiftBoolean 
		meta: metaBoolean 
		control: controlBoolean 
		option: optionBoolean
]

{ #category : 'tests' }
GtkKeyEventTest >> newFromKeyValue: aValue [

	^ self classToTest 
		newKeyValue: aValue
		shift: false 
		meta: false 
		control: false 
		option: false
]

{ #category : 'tests' }
GtkKeyEventTest >> newFromKeyValue: aValue keyCode: aKeyCode [

	^ self classToTest 
		newKeyValue: aValue
		keyCode: aKeyCode
		shift: false 
		meta: false 
		control: false 
		option: false
]

{ #category : 'running' }
GtkKeyEventTest >> runCase [

	TFProcessLocalWorker worker: TFSameThreadRunner uniqueInstance.
	[ super runCase ]
	ensure: [ TFProcessLocalWorker worker: nil ]
]

{ #category : 'tests' }
GtkKeyEventTest >> testAsKeyCombination [
	| event km |
	
	event := self newFromCharacter: $w 
		shift: false 
		meta: false 
		control: true 
		option: false.
	
	km := event asKeyCombination.
	self assert: km equals: $w control
	
]

{ #category : 'tests' }
GtkKeyEventTest >> testKey [
	| event |
	
	event := self newFromCharacter: $x.
	self assert: event key equals: KeyboardKey X.
	
	event := self newFromKeyValue: KEY_BackSpace keyCode: KeyboardKey backspace.
	self assert: event key equals: KeyboardKey backspace.
]

{ #category : 'tests' }
GtkKeyEventTest >> testKeyCharacter [
	| event |
	
	event := self newFromCharacter: $x.
	self assert: event keyCharacter equals: $x.
	
	event := self newFromKeyValue: KEY_BackSpace keyCode: KeyboardKey backspace.
	self assert: event keyCharacter equals: Character backspace.
]

{ #category : 'tests' }
GtkKeyEventTest >> testModifiedCharacter [
	| event |
	
	event := self newFromCharacter: $x.
	self assert: event modifiedCharacter equals: $x.
	
	event := self newFromKeyValue: KEY_BackSpace keyCode: KeyboardKey backspace.
	self assert: event modifiedCharacter equals: Character backspace.
]

{ #category : 'tests' }
GtkKeyEventTest >> testScanCode [
	| event |
	
	event := self newFromCharacter: $x.
	self 
		assert: event scanCode 
		equals: (KeyboardKey fromCharacter: $x) value
]
