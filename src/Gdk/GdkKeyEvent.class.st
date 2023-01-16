"
Describes a key press or key release event.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventKey
"
Class {
	#name : #GdkKeyEvent,
	#superclass : #GdkEvent,
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#instVars : [
		'keyValue',
		'key'
	],
	#classVars : [
		'InternalMap'
	],
	#pools : [
		'GdkKeyCodes',
		'GdkModifierType'
	],
	#category : #'Gdk-Events'
}

{ #category : #'private - compatibility' }
GdkKeyEvent class >> createInternalMap [

	^ IdentityDictionary newFromPairs: { 
	KEY_BackSpace. 				Character backspace asciiValue.
	KEY_Tab. 						Character tab asciiValue.
	KEY_Linefeed. 				Character lf asciiValue.
	KEY_Clear. 					nil.
	KEY_Return. 					Character cr asciiValue.
	KEY_Pause. 					nil.
	KEY_Scroll_Lock. 			nil.
	KEY_Sys_Req. 				nil.
	KEY_Escape. 					Character escape asciiValue.
	KEY_Delete. 					Character delete asciiValue.
	KEY_Home. 					Character home asciiValue.
	KEY_Left. 					Character arrowLeft asciiValue.
	KEY_Up. 						Character arrowUp asciiValue.
	KEY_Right. 					Character arrowRight asciiValue.
	KEY_Down.						Character arrowDown asciiValue.
	KEY_Prior. 					nil.
	KEY_Page_Up. 				Character pageUp asciiValue.
	KEY_Next.						nil.
	KEY_Page_Down.				Character pageDown asciiValue.
	KEY_End. 						Character end asciiValue.
	KEY_Begin.					Character home asciiValue.
	KEY_Select.					nil.
	KEY_Print.	 				nil.
	KEY_Execute. 				nil.
	KEY_Insert.					Character insert asciiValue.
	KEY_Undo. 					nil.
	KEY_Redo.						nil.
	KEY_Menu.						nil.
	KEY_Find.						nil.
	KEY_Cancel. 					nil.
	KEY_Help.						nil.
	KEY_Break. 					nil.
	KEY_Mode_switch. 			nil.
	KEY_script_switch. 		nil.
	KEY_Num_Lock. 				nil. 
	}
]

{ #category : #'private - compatibility' }
GdkKeyEvent class >> internalMap [

	^ InternalMap ifNil: [ InternalMap := self createInternalMap ]
]

{ #category : #'private - compatibility' }
GdkKeyEvent class >> internalMapAt: aCode ifAbsentOrNil: aBlock [
	
	self internalMap
		at: aCode
		ifPresent: [ :value | 
			value ifNotNil: [ ^ value ] ].
		
	^ aBlock value
]

{ #category : #utility }
GdkKeyEvent class >> keyValToUnicode: keyval [

	 ^ self ffiCall: #(guint32 gdk_keyval_to_unicode  (guint keyval))
]

{ #category : #private }
GdkKeyEvent class >> modMask [

	^ self ffiCall: #(uint32 gtk_accelerator_get_default_mod_mask (void))
]

{ #category : #'instance creation' }
GdkKeyEvent class >> newKeyPress [

	self deprecated: #Gtk4
]

{ #category : #'instance creation' }
GdkKeyEvent class >> newKeyPressValue: keyVal shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	self deprecated: #Gtk4
]

{ #category : #'instance creation' }
GdkKeyEvent class >> newKeyRelease [

	self deprecated: #Gtk4
]

{ #category : #'instance creation' }
GdkKeyEvent class >> newKeyReleaseValue: keyVal shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	self deprecated: #Gtk4
]

{ #category : #utility }
GdkKeyEvent class >> unicodeToKeyVal: wc [

	^ self ffiCall: #(guint gdk_unicode_to_keyval  (guint32 wc))
]

{ #category : #compatibility }
GdkKeyEvent >> asKeyCombination [

	^ KMKeyCombination fromEventKey: self
]

{ #category : #compatibility }
GdkKeyEvent >> basicKey [

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
GdkKeyEvent >> character [

	^ self keyCharacter
]

{ #category : #accessing }
GdkKeyEvent >> description [ 

	^ self stringOrNil ifNil: [ '<nodesc>' ]
]

{ #category : #testing }
GdkKeyEvent >> isEscape [

	^ self keyValue = KEY_Escape
]

{ #category : #testing }
GdkKeyEvent >> isKeyDown [

	^ self keyValue = KEY_Down
]

{ #category : #testing }
GdkKeyEvent >> isKeyEvent [

	^ true
]

{ #category : #testing }
GdkKeyEvent >> isKeyLeft [

	^ self keyValue = KEY_Left
]

{ #category : #testing }
GdkKeyEvent >> isKeyPress [

	^ false
]

{ #category : #testing }
GdkKeyEvent >> isKeyRelease [

	^ false
]

{ #category : #testing }
GdkKeyEvent >> isKeyRight [

	^ self keyValue = KEY_Right
]

{ #category : #testing }
GdkKeyEvent >> isKeyUp [

	^ self keyValue = KEY_Up
]

{ #category : #testing }
GdkKeyEvent >> isModifier [
	"Answers if the keycode received is a modifier (for example, control or alt)"

	^ self ffiCall: #(gboolean gdk_key_event_is_modifier (self))
]

{ #category : #testing }
GdkKeyEvent >> isReturn [

	^ self keyValue = KEY_Return
]

{ #category : #compatibility }
GdkKeyEvent >> isTextInput [

	self hasControlModifier ifTrue: [ ^ false ].
	self hasCommandModifier ifTrue: [ ^ false ].
	^ (self class internalMap keys includes: self keyValue) not
]

{ #category : #compatibility }
GdkKeyEvent >> key [

	^ key ifNil: [ key := self basicKey ]
]

{ #category : #compatibility }
GdkKeyEvent >> keyCharacter [

	^ Character value: (self toInternalValue: self keyValue)
]

{ #category : #accessing }
GdkKeyEvent >> keyCode [

	^ self ffiCall: #(guint gdk_key_event_get_keycode (self))
]

{ #category : #accessing }
GdkKeyEvent >> keySymbol [

	^ self state = 0 
		ifTrue: [ self keyValue ]
		ifFalse: [ self keyValue & (self state & self class modMask)  ] 
]

{ #category : #accessing }
GdkKeyEvent >> keyValue [

	^ keyValue ifNil: [ keyValue := self keyval ]
]

{ #category : #accessing }
GdkKeyEvent >> keyval [

	^ self ffiCall: #(guint gdk_key_event_get_keyval (self))
]

{ #category : #accessing }
GdkKeyEvent >> layout [

	^ self ffiCall: #(guint gdk_key_event_get_layout (self))
]

{ #category : #accessing }
GdkKeyEvent >> level [

	^ self ffiCall: #(guint gdk_key_event_get_level (self))
]

{ #category : #compatibility }
GdkKeyEvent >> modifiedCharacter [
	
	self character ifNotNil: [ :c | ^ c ].
	self keyValue <= 16rFF ifTrue: [ ^ Character value: self keyValue ]. 
	^ Character value: 0
]

{ #category : #compatibility }
GdkKeyEvent >> scanCode [

	^ self keyCode
]

{ #category : #compatibility }
GdkKeyEvent >> state [

	^ self modifierState
]

{ #category : #accessing }
GdkKeyEvent >> stringOrNil [ 
	| unicodeVal |
	
	unicodeVal := self class keyValToUnicode: self keyval.
	unicodeVal = 0 ifTrue: [ ^ nil ].
	^ Unicode value: unicodeVal
]

{ #category : #compatibility }
GdkKeyEvent >> symbol [

	^ self isModifier 
		ifTrue: [ 0 ] 
		ifFalse: [ self keyValue ]
]

{ #category : #compatibility }
GdkKeyEvent >> toInternalValue: aKeyValue [ 

	^ self class 
		internalMapAt: aKeyValue 
		ifAbsentOrNil: [ aKeyValue ]
]
