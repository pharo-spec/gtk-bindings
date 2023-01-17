"
Simulate a `GdkKeyEvent`
"
Class {
	#name : #GdkSimulatedKeyEvent,
	#superclass : #GdkSimulatedEvent,
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#instVars : [
		'keyVal',
		'keyCode',
		'state',
		'unicodeValue'
	],
	#pools : [
		'GdkKeyCodes',
		'GdkModifierType'
	],
	#category : #'Gtk4-Event-Simulated'
}

{ #category : #'instance creation' }
GdkSimulatedKeyEvent class >> newCharacter: aCharacter shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	^ self
		newKeyValue: aCharacter asciiValue
		keyCode: (KeyboardKey fromCharacter: aCharacter) value
		shift: shiftBoolean
		meta: metaBoolean
		control: controlBoolean
		option: optionBoolean
]

{ #category : #'instance creation' }
GdkSimulatedKeyEvent class >> newKeyVal: keyVal keyCode: keyCode state: state [

	^ self basicNew
		initializeKeyVal: keyVal
		keyCode: keyCode
		state: state
]

{ #category : #'instance creation' }
GdkSimulatedKeyEvent class >> newKeyValue: keyVal keyCode: keyCode shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [
	| state |

	state := GdkModifierType newValue: 0.
	shiftBoolean ifTrue: [ state := state | GDK_SHIFT_MASK ].
	metaBoolean ifTrue: [ state := state | GDK_META_MASK ].
	controlBoolean ifTrue: [ state := state | GDK_CONTROL_MASK ].
	optionBoolean ifTrue: [ state := state | GDK_MOD1_MASK "Mod1 = Alt, Option" ].

	^ self
		newKeyVal: keyVal
		keyCode: keyCode
		state: state
]

{ #category : #'instance creation' }
GdkSimulatedKeyEvent class >> newKeyValue: keyVal shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	^ self
		newKeyValue: keyVal
		keyCode: (KeyboardKey fromCharacter: (Character value: keyVal)) value
		shift: shiftBoolean
		meta: metaBoolean
		control: controlBoolean
		option: optionBoolean
]

{ #category : #compatibility }
GdkSimulatedKeyEvent >> asKeyCombination [

	^ KMKeyCombination fromEventKey: self
]

{ #category : #compatibility }
GdkSimulatedKeyEvent >> character [

	^ self keyCharacter
]

{ #category : #testing }
GdkSimulatedKeyEvent >> hasModifier: aModifier [

	^ (self state & aModifier) = aModifier
]

{ #category : #initialization }
GdkSimulatedKeyEvent >> initializeKeyVal: keyValNumber keyCode: keyCodeNumber state: stateNumber [

	self initialize.
	keyVal := keyValNumber.
	keyCode := keyCodeNumber.
	state := stateNumber
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isEscape [

	^ self keyValue = KEY_Escape
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isKeyDown [

	^ self keyValue = KEY_Down
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isKeyEvent [

	^ true
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isKeyLeft [

	^ self keyValue = KEY_Left
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isKeyPress [

	^ false
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isKeyRelease [

	^ false
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isKeyRight [

	^ self keyValue = KEY_Right
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isKeyUp [

	^ self keyValue = KEY_Up
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isModifier [

	^ false
]

{ #category : #testing }
GdkSimulatedKeyEvent >> isReturn [

	^ self keyValue = KEY_Return
]

{ #category : #compatibility }
GdkSimulatedKeyEvent >> key [

	self keyValue <= 16rFF ifTrue: [
		(KeyboardKey
			fromCharacter: self keyCharacter
			ifNone: [ nil ])
			ifNotNil: [ :aKey | ^ aKey ] ].

	^ KeyboardKey
		atValue: self keyValue
		ifAbsent: [ Smalltalk os keyForValue: self scanCode ]
]

{ #category : #compatibility }
GdkSimulatedKeyEvent >> keyCharacter [

	^ Unicode value: self unicodeValue
]

{ #category : #accessing }
GdkSimulatedKeyEvent >> keyCode [

	^ keyCode
]

{ #category : #accessing }
GdkSimulatedKeyEvent >> keyVal [

	^ keyVal
]

{ #category : #accessing }
GdkSimulatedKeyEvent >> keyValue [

	^ self keyVal
]

{ #category : #compatibility }
GdkSimulatedKeyEvent >> modifiedCharacter [

	self flag: #TODO. "This I think is always `self character` ?"
	self character ifNotNil: [ :c | ^ c ].
	self symbol <= 16rFF ifTrue: [ ^ Unicode value: self symbol ].
	^ Unicode value: 0
]

{ #category : #printing }
GdkSimulatedKeyEvent >> printOn: stream [

	super printOn: stream.
	stream << '('.
	stream << 'keyVal=' << self keyVal asString.
	stream << ', keyCode=' << self keyCode asString.
	stream << ', state=' << self state asString.
	stream << ')'
]

{ #category : #compatibility }
GdkSimulatedKeyEvent >> scanCode [

	^ self keyCode
]

{ #category : #accessing }
GdkSimulatedKeyEvent >> state [

	^ state
]

{ #category : #compatibility }
GdkSimulatedKeyEvent >> symbol [

	^ self keyValue
]

{ #category : #accessing }
GdkSimulatedKeyEvent >> unicodeValue [

	^ unicodeValue ifNil: [ unicodeValue := GdkKeyEvent keyValToUnicode: self keyVal ]
]
