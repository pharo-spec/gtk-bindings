"
I'm used to convert Gtk events into Morphic events to be passed to GtkMorphView instances.
"
Class {
	#name : 'GtkMorphicEventHandler',
	#superclass : 'OSWindowMorphicEventHandler',
	#instVars : [
		'imContext',
		'lastEvent'
	],
	#pools : [
		'GdkKeyCodes'
	],
	#classInstVars : [
		'symbolCharacterMapping'
	],
	#category : 'Gtk-Morphic',
	#package : 'Gtk-Morphic'
}

{ #category : 'as yet unclassified' }
GtkMorphicEventHandler class >> createSymbolCharacterMapping [
	| mapping |

	mapping := Dictionary new.
	{
		KEY_Escape. Character escape.
	 	KEY_Return . Character cr.
	  	KEY_BackSpace . Character backspace.
	 	KEY_Tab . Character tab.
	 	KEY_Home . Character home.
	 	KEY_Left . Character arrowLeft.
	 	KEY_Up . Character arrowUp.
	 	KEY_Right . Character arrowRight.
	 	KEY_Down . Character arrowDown.
	 	KEY_End . Character end.
	 	KEY_Insert . Character insert.
	 	KEY_Page_Up . Character pageUp.
	 	KEY_Page_Down . Character pageDown.
	 	KEY_Delete. Character delete.
		"Dead characters"		
		KEY_dead_circumflex. $^.
		"OSK_KP_0 . $0.
	 	OSK_KP_1 . $1.
	 	OSK_KP_2 . $2.
	 	OSK_KP_3 . $3.
	 	OSK_KP_4 . $4.
	 	OSK_KP_5 . $5.
	 	OSK_KP_6 . $6.
	 	OSK_KP_7 . $7.
	 	OSK_KP_8 . $8.
	 	OSK_KP_9 . $9.
	 	OSK_KP_DIVIDE . $/.
	 	OSK_KP_MULTIPLY . $*.
	 	OSK_KP_PLUS . $+.
	 	OSK_KP_MINUS . $-.
	 	OSK_KP_ENTER . Character cr.
	 	OSK_KP_PERIOD . $. "
	} pairsDo: [ :key :val | mapping at: key put: val charCode ].
	
	^ mapping
]

{ #category : 'as yet unclassified' }
GtkMorphicEventHandler class >> symbolCharacterMapping [

	^ symbolCharacterMapping ifNil: [ symbolCharacterMapping := self createSymbolCharacterMapping ]
]

{ #category : 'as yet unclassified' }
GtkMorphicEventHandler class >> symbolCharacterMappingAt: aKey ifAbsent: aBlock [

	^ self symbolCharacterMapping 
		at: aKey
		ifAbsent: aBlock
]

{ #category : 'private' }
GtkMorphicEventHandler >> convertModifiers: anEvent [
	| modifiers button |

	modifiers := 0.
	
	"Alt/Option key"
	anEvent hasAltModifier ifTrue: [
		"On windows and unix, treat alt key as command key"
		modifiers := Smalltalk os isWin32 | Smalltalk os isUnix
			ifTrue: [ modifiers | 2r01000000 ]
			ifFalse: [ modifiers | 2r00100000 ] ]. 
	
	anEvent hasControlModifier ifTrue: [ modifiers := modifiers | 2r00010000 ]. "Control key"
	anEvent hasShiftModifier ifTrue: [ modifiers := modifiers | 8 ]. "Shift key"
	anEvent hasCommandModifier ifTrue: [ modifiers := modifiers | 2r01000000 ]. "Cmd key".
	
	button := anEvent button.
	(button ~= 1 and: [ anEvent hasButton1Modifier ]) 
		ifTrue: [ modifiers := modifiers | MouseButtonEvent redButton ].
	(button ~= 2 and: [ anEvent hasButton2Modifier ]) 
		ifTrue: [ modifiers := modifiers | MouseButtonEvent blueButton ].
	(button ~= 3 and: [ anEvent hasButton3Modifier ]) 
		ifTrue: [ modifiers := modifiers | MouseButtonEvent yellowButton ].

	^ modifiers
]

{ #category : 'private' }
GtkMorphicEventHandler >> doKeystroke: aString [
	| char keyStrokeEvent |

	char := aString first.
		
	keyStrokeEvent := KeyboardEvent new
		setType: #keystroke
		buttons: (self convertModifiers: lastEvent)
		position: lastEvent position
		keyValue: char charCode
		charCode: char charCode
		hand:  morphicWorld activeHand
		stamp: Time millisecondClockValue.
	
	keyStrokeEvent
		scanCode: lastEvent scanCode;
		key: lastEvent key.
	
	self dispatchMorphicEvent: keyStrokeEvent
]

{ #category : 'private' }
GtkMorphicEventHandler >> evaluateUserInterrupt: anEvent [

	(anEvent isKeyEvent
		and: [ anEvent isKeyPress
		and: [ anEvent hasAnyModifier 
		and: [ anEvent keyCharacter = $. ] ] ])
		ifTrue: [ UserInterruptHandler new handleUserInterrupt ]
]

{ #category : 'events' }
GtkMorphicEventHandler >> handleEvent: anEvent [
	"convert the event to morphic one, and dispatch it whatever..."
	| morphicEvent |
	
	morphicEvent := anEvent accept: self.
	morphicEvent isMorphicEvent ifFalse: [ ^ false ].	
	
	self evaluateUserInterrupt: anEvent.

	self dispatchMorphicEvent: morphicEvent.

	^ morphicEvent wasHandled
]

{ #category : 'private' }
GtkMorphicEventHandler >> imContext [

	^ imContext ifNil: [ 
		imContext := GRunLoop defer: [ GtkIMContext newSimple ] ]
]

{ #category : 'initialization' }
GtkMorphicEventHandler >> initialize [

	super initialize.
	GRunLoop defer: [ 
		self imContext 
			connectCommit: [ :aString | self doKeystroke: aString ] ]
]

{ #category : 'private' }
GtkMorphicEventHandler >> mapSymbolToKeyValue: symbol [

	^ self class 
		symbolCharacterMappingAt: symbol 
		ifAbsent: [
			symbol = KEY_VoidSymbol
				ifTrue: [ nil ]
				ifFalse: [ symbol ] ]
]

{ #category : 'private' }
GtkMorphicEventHandler >> processKeyDownEvent: anEvent modifiers: modifiers [
	| keyDownEvent keyValue |

	keyValue := self mapSymbolToKeyValue: anEvent symbol.
	keyValue = 0 ifTrue: [ ^ nil ].
	
	keyDownEvent := KeyboardEvent new
		setType: #keyDown
		buttons: modifiers
		position: (self convertPosition: anEvent position asIntegerPoint)
		keyValue: keyValue
		charCode: keyValue
		hand:  self activeHand
		stamp: Time millisecondClockValue.
	keyDownEvent
		scanCode: anEvent scanCode;
		key: anEvent key.

	self dispatchMorphicEvent: keyDownEvent.
	
	^ keyDownEvent
]

{ #category : 'private' }
GtkMorphicEventHandler >> processKeystrokeEvent: anEvent modifiers: modifiers [

	anEvent isTextInput ifFalse: [ ^ nil ].

	"That's stupid and horrible, but that's the way we doing it for now"
	anEvent keyValue = 27 "Esc" ifFalse: [
		anEvent character ifNil: [ 
			(modifiers alt or: [ modifiers ctrl or: [ modifiers cmd ] ]) ifFalse: [ 
				^ nil ] ] ].

	lastEvent := anEvent copyInMemory.		
	GRunLoop defer: [ 
		self imContext filterKeypress: anEvent ]
]

{ #category : 'visiting' }
GtkMorphicEventHandler >> visitCrossingEvent: anEvent [

	self flag: #TODO. "do something"
]

{ #category : 'visiting' }
GtkMorphicEventHandler >> visitKeyDownEvent: anEvent [
	| modifiers keyDownEvent |

	modifiers := self convertModifiers: anEvent modifiers.
	keyDownEvent := self processKeyDownEvent: anEvent modifiers: modifiers.
	self processKeystrokeEvent: anEvent modifiers: modifiers.
	
	keyDownEvent ifNotNil: [ 
		keyDownEvent wasHandled: ((morphicWorld morph handlesKeyDown: keyDownEvent) 
			or: [ morphicWorld morph handlesKeyStroke: keyDownEvent ]) ].
	
	^ keyDownEvent
]

{ #category : 'visiting' }
GtkMorphicEventHandler >> visitKeyUpEvent: anEvent [
	| keyUpEvent keyValue |

	keyValue := self mapSymbolToKeyValue: anEvent symbol.
	keyValue = 0 ifTrue: [ ^ self ].
	
	keyUpEvent := KeyboardEvent new
		setType: #keyUp
		buttons: (self convertModifiers: anEvent modifiers)
		position: (self convertPosition: anEvent position asIntegerPoint)
		keyValue: keyValue
		charCode: keyValue
		hand:  self activeHand
		stamp: Time millisecondClockValue.
	keyUpEvent
		scanCode: anEvent scanCode;
		key: anEvent key.
	
	self dispatchMorphicEvent: keyUpEvent
]

{ #category : 'visiting' }
GtkMorphicEventHandler >> visitMouseButtonPressEvent: anEvent [

	GRunLoop defer: [ self imContext reset ].
	^ super visitMouseButtonPressEvent: anEvent
]

{ #category : 'visiting' }
GtkMorphicEventHandler >> visitScrollEvent: anEvent [

	self flag: #TODO. "do something"
]

{ #category : 'visiting' }
GtkMorphicEventHandler >> visitUnknownEvent: anEvent [

	"anEvent type crLog."
	^ nil
]
