"
A printer to transform system shortcut into something `GtkShortcutsShortcut` can understand.
"
Class {
	#name : #GtkShortcutsShortcutPrinter,
	#superclass : #OSPlatformVisitor,
	#classVars : [
		'SymbolTable'
	],
	#category : #'Gtk-Shortcuts'
}

{ #category : #private }
GtkShortcutsShortcutPrinter class >> createSymbolTable [

	^ Dictionary newFromPairs: { 
		#Cmd. 		(Character value: 16r2318) asString.
		#Meta. 	(Character value: 16r2318) asString.
		#Alt. 		(Character value: 16r2325) asString. 
		#Ctrl.  	(Character value: 16r2303) asString. 
		#Shift. 	(Character value: 16r21E7) asString.
		#Enter. 	(Character value: 16r23ce) asString }
]

{ #category : #private }
GtkShortcutsShortcutPrinter class >> symbolTable [

	^ SymbolTable ifNil: [ SymbolTable := self createSymbolTable ]
]

{ #category : #private }
GtkShortcutsShortcutPrinter class >> symbolTableAt: anObject ifAbsent: aBlock [

	^ self symbolTable 
		at: anObject 
		ifAbsent: aBlock
]

{ #category : #'instance creation' }
GtkShortcutsShortcutPrinter class >> toString: aShortcut [

	^ aShortcut acceptVisitor: self new
]

{ #category : #private }
GtkShortcutsShortcutPrinter >> basicModifierStringsOf: aShortcut [
		
	^ (aShortcut platformModifier asString substrings: '+') collect: [ :each | each trimBoth ]
]

{ #category : #visiting }
GtkShortcutsShortcutPrinter >> mapSpecialCharacter: char [ 

	char = KeyboardKey enter ifTrue: [ ^ 'Enter' ].
	char = (KeyboardKey fromCharacter: Character space) ifTrue: [ ^ 'Space' ].
	^ char	 name
]

{ #category : #private }
GtkShortcutsShortcutPrinter >> shortcutModifiersOf: aShortcut [
	| modifiers |
	
	modifiers := self basicModifierStringsOf: aShortcut.
	modifiers replaceAll: 'Meta' with: 'Ctrl'.
	
	"Ensure shift is first"
	((modifiers includes: 'Shift') 
		and: [ modifiers first ~= 'Shift' ])
		ifTrue: [ modifiers := (modifiers copyWithout: 'Shift') copyWithFirst: 'Shift' ].
	
	^ modifiers		
]

{ #category : #visiting }
GtkShortcutsShortcutPrinter >> visitCombinationShortcut: aShortcut [

	^ (aShortcut sequence collect: [ :e | self visitSingleShortcut: e ]) joinUsing: '+'
]

{ #category : #visiting }
GtkShortcutsShortcutPrinter >> visitSingleShortcut: aShortcut [
	| char |

	char := self mapSpecialCharacter: aShortcut platformCharacter.
	^ String streamContents: [ :stream | 
		(self shortcutModifiersOf: aShortcut) ifNotEmpty: [ :modifiers |  
			modifiers do: [ :each | stream << '<' << each << '>' ] ].
		stream << char asString asLowercase ]
]
