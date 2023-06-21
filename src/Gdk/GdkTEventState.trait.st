"
I add state interpretation aspects to events who contain the ""state"" field.

"
Trait {
	#name : #GdkTEventState,
	#category : #'Gdk-Base'
}

{ #category : #compatibility }
GdkTEventState >> alt [

	^ self hasAltModifier
]

{ #category : #compatibility }
GdkTEventState >> any [

	^ self hasAltModifier | self hasControlModifier | self hasSuperModifier
]

{ #category : #testing }
GdkTEventState >> hasAltModifier [

	^ self hasMod1
]

{ #category : #testing }
GdkTEventState >> hasAnyModifier [

	^ self state ~= 0
]

{ #category : #testing }
GdkTEventState >> hasButton1Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON1_MASK
]

{ #category : #testing }
GdkTEventState >> hasButton2Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON2_MASK
]

{ #category : #testing }
GdkTEventState >> hasButton3Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON3_MASK
]

{ #category : #testing }
GdkTEventState >> hasButton4Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON4_MASK
]

{ #category : #testing }
GdkTEventState >> hasButton5Modifier [

	^ self hasModifier: GdkModifierType GDK_BUTTON5_MASK
]

{ #category : #testing }
GdkTEventState >> hasCommandModifier [
	"by testing, it seems that macOS command is being mapped to mod2"
	
	^ self hasSuperModifier or: [ OSPlatform current isMacOS and: [ self hasMod2 ] ]
]

{ #category : #testing }
GdkTEventState >> hasControlModifier [

	^ self hasModifier: GdkModifierType GDK_CONTROL_MASK
]

{ #category : #testing }
GdkTEventState >> hasLockModifier [

	^ self hasModifier: GdkModifierType GDK_LOCK_MASK	
]

{ #category : #testing }
GdkTEventState >> hasMetaModifier [

	^ self hasModifier: GdkModifierType GDK_META_MASK
]

{ #category : #testing }
GdkTEventState >> hasMod1 [

	^ self hasModifier: GdkModifierType GDK_MOD1_MASK
]

{ #category : #testing }
GdkTEventState >> hasMod2 [

	^ self hasModifier: GdkModifierType GDK_MOD2_MASK
]

{ #category : #testing }
GdkTEventState >> hasMod3 [

	^ self hasModifier: GdkModifierType GDK_MOD3_MASK
]

{ #category : #testing }
GdkTEventState >> hasMod4 [

	^ self hasModifier: GdkModifierType GDK_MOD4_MASK
]

{ #category : #testing }
GdkTEventState >> hasMod5 [

	^ self hasModifier: GdkModifierType GDK_MOD5_MASK
]

{ #category : #testing }
GdkTEventState >> hasModifier: aModifier [

	^ (self state & (aModifier value)) = aModifier value
]

{ #category : #testing }
GdkTEventState >> hasShiftModifier [

	^ self hasModifier: GdkModifierType GDK_SHIFT_MASK
]

{ #category : #testing }
GdkTEventState >> hasSuperModifier [

	^ self hasModifier: GdkModifierType GDK_SUPER_MASK
]

{ #category : #compatibility }
GdkTEventState >> modifiers [
	"modifiers are included in the event"

	^ self
]

{ #category : #compatibility }
GdkTEventState >> state [

	self shouldBeImplemented
]
