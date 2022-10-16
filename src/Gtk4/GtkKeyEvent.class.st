Class {
	#name : #GtkKeyEvent,
	#superclass : #Object,
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#instVars : [
		'keyVal',
		'keyCode',
		'state',
		'wasHandled',
		'unicodeValue'
	],
	#pools : [
		'GdkKeyCodes',
		'GdkModifierType'
	],
	#category : #'Gtk4-Event-Callbacks'
}

{ #category : #'instance creation' }
GtkKeyEvent class >> newCharacter: aCharacter shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	^ self 
		newKeyValue: aCharacter asciiValue
		keyCode: (KeyboardKey fromCharacter: aCharacter) value 
		shift: shiftBoolean 
		meta: metaBoolean 
		control: controlBoolean 
		option: optionBoolean
]

{ #category : #'instance creation' }
GtkKeyEvent class >> newKeyVal: keyVal keyCode: keyCode state: state [

	^ self basicNew  
		initializeKeyVal: keyVal 
		keyCode: keyCode 
		state: state	
]

{ #category : #'instance creation' }
GtkKeyEvent class >> newKeyValue: keyVal keyCode: keyCode shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [
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
GtkKeyEvent class >> newKeyValue: keyVal shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	^ self 
		newKeyValue: keyVal 
		keyCode: (KeyboardKey fromCharacter: (Character value: keyVal)) value
		shift: shiftBoolean 
		meta: metaBoolean 
		control: controlBoolean 
		option: optionBoolean
]

{ #category : #compatibility }
GtkKeyEvent >> asKeyCombination [

	^ KMKeyCombination fromEventKey: self
]

{ #category : #compatibility }
GtkKeyEvent >> character [

	^ self keyCharacter
]

{ #category : #testing }
GtkKeyEvent >> hasModifier: aModifier [

	^ (self state & aModifier) = aModifier
]

{ #category : #initialization }
GtkKeyEvent >> initialize [
	
	super initialize.
	wasHandled := false
]

{ #category : #initialization }
GtkKeyEvent >> initializeKeyVal: keyValNumber keyCode: keyCodeNumber state: stateNumber [

	self initialize.
	keyVal := keyValNumber.
	keyCode := keyCodeNumber.
	state := stateNumber	
]

{ #category : #testing }
GtkKeyEvent >> isEscape [

	^ self keyValue = KEY_Escape
]

{ #category : #testing }
GtkKeyEvent >> isKeyDown [

	^ self keyValue = KEY_Down
]

{ #category : #testing }
GtkKeyEvent >> isKeyLeft [

	^ self keyValue = KEY_Left
]

{ #category : #testing }
GtkKeyEvent >> isKeyPress [

	^ false
]

{ #category : #testing }
GtkKeyEvent >> isKeyRelease [

	^ false
]

{ #category : #testing }
GtkKeyEvent >> isKeyRight [

	^ self keyValue = KEY_Right
]

{ #category : #testing }
GtkKeyEvent >> isKeyUp [

	^ self keyValue = KEY_Up
]

{ #category : #testing }
GtkKeyEvent >> isModifier [

	^ self state ~= 0
]

{ #category : #testing }
GtkKeyEvent >> isReturn [

	^ self keyValue = KEY_Return
]

{ #category : #compatibility }
GtkKeyEvent >> key [ 

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
GtkKeyEvent >> keyCharacter [

	^ Unicode value: self unicodeValue
]

{ #category : #accessing }
GtkKeyEvent >> keyCode [

	^ keyCode
]

{ #category : #accessing }
GtkKeyEvent >> keyVal [

	^ keyVal
]

{ #category : #accessing }
GtkKeyEvent >> keyValue [

	^ self keyVal
]

{ #category : #compatibility }
GtkKeyEvent >> modifiedCharacter [
	
	self flag: #TODO. "This I think is always `self character` ?"
	self character ifNotNil: [ :c | ^ c ].
	self symbol <= 16rFF ifTrue: [ ^ Unicode value: self symbol ]. 
	^ Unicode value: 0
]

{ #category : #printing }
GtkKeyEvent >> printOn: stream [

	super printOn: stream.
	stream << '('.
	stream << 'keyVal=' << self keyVal asString.
	stream << ', keyCode=' << self keyCode asString.
	stream << ', state=' << self state asString.
	stream << ')'
]

{ #category : #compatibility }
GtkKeyEvent >> scanCode [
	
	^ self keyCode
]

{ #category : #accessing }
GtkKeyEvent >> state [

	^ state
]

{ #category : #compatibility }
GtkKeyEvent >> symbol [

	^ self keyValue
]

{ #category : #accessing }
GtkKeyEvent >> unicodeValue [

	^ unicodeValue ifNil: [ unicodeValue := GdkEventKey keyValToUnicode: self keyVal ]
]

{ #category : #compatibility }
GtkKeyEvent >> wasHandled [

	^ wasHandled
]

{ #category : #compatibility }
GtkKeyEvent >> wasHandled: aBoolean [

	wasHandled := aBoolean
]
