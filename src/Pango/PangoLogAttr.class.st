"
I'm a FFI binding for PangoLogAttr, a structure stores information about the attributes of a single character.

struct PangoLogAttr {
  guint is_line_break : 1;
  guint is_mandatory_break : 1;
  guint is_char_break : 1;
  guint is_white : 1;
  guint is_cursor_position : 1;
  guint is_word_start : 1;
  guint is_word_end : 1;
  guint is_sentence_boundary : 1;
  guint is_sentence_start : 1;
  guint is_sentence_end : 1;
  guint backspace_deletes_character : 1;
  guint is_expandable_space : 1;
  guint is_word_boundary : 1;
  guint break_inserts_hyphen : 1;
  guint break_removes_preceding : 1;
  guint reserved : 17;
}

See: https://docs.gtk.org/Pango/struct.LogAttr.html
"
Class {
	#name : 'PangoLogAttr',
	#superclass : 'GStructure',
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#classVars : [
		'OFFSET_FLAGS'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'as yet unclassified' }
PangoLogAttr class >> compileBitAccessors [
	"self compileBitAccessors"

	| names |
	names := (('guint is_line_break : 1;
	  guint is_mandatory_break : 1;
	  guint is_char_break : 1;
	  guint is_white : 1;
	  guint is_cursor_position : 1;
	  guint is_word_start : 1;
	  guint is_word_end : 1;
	  guint is_sentence_boundary : 1;
	  guint is_sentence_start : 1;
	  guint is_sentence_end : 1;
	  guint backspace_deletes_character : 1;
	  guint is_expandable_space : 1;
	  guint is_word_boundary : 1;
	  guint break_inserts_hyphen : 1;
	  guint break_removes_preceding : 1' splitOn: $;) collect: [ :each | 
		| underscoredName camelCaseName words |
		underscoredName := (each trim splitOn: Character space) second.
		words := underscoredName splitOn: $_.
		camelCaseName := String streamContents:[:writeStream |
			words readStreamDo: [:readStream |
				writeStream << readStream next.
				[ readStream atEnd ] whileFalse: [
					writeStream << readStream next capitalized ]
				]
			].
		]).

	names withIndexDo:[:each :index |
		| src |
		src := '{1}
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: {2}) == 1' format: { each. index}.

		PangoLogAttr compile: src classified: 'accessing - bit flags' ].

	names withIndexDo:[:each :index |
		| src |
		src := '{1}: aBoolean
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: {2} put: aBoolean asBit' format: { each. index}.

		PangoLogAttr compile: src classified: 'accessing - bit flags' ].

]

{ #category : 'field definition' }
PangoLogAttr class >> fieldsDesc [
	"Hack to support bit flags. See doc linked in class comment.
	
	self rebuildFieldAccessors"
	
	^ #(
		  uint32 flags
		)
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> backspaceDeletesCharacter [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 11) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> backspaceDeletesCharacter: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 11 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> breakInsertsHyphen [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 14) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> breakInsertsHyphen: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 14 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> breakRemovesPreceding [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 15) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> breakRemovesPreceding: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 15 put: aBoolean asBit
]

{ #category : 'accessing - structure variables' }
PangoLogAttr >> flags [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FLAGS
]

{ #category : 'accessing - structure variables' }
PangoLogAttr >> flags: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isCharBreak [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 3) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isCharBreak: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 3 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isCursorPosition [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 5) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isCursorPosition: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 5 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isExpandableSpace [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 12) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isExpandableSpace: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 12 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isLineBreak [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 1) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isLineBreak: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 1 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isMandatoryBreak [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 2) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isMandatoryBreak: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 2 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isSentenceBoundary [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 8) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isSentenceBoundary: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 8 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isSentenceEnd [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 10) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isSentenceEnd: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 10 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isSentenceStart [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 9) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isSentenceStart: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 9 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWhite [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 4) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWhite: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 4 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWordBoundary [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 13) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWordBoundary: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 13 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWordEnd [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 7) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWordEnd: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 7 put: aBoolean asBit
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWordStart [
	"Answer whether the bit flag is enabled on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ (self flags bitAt: 6) == 1
]

{ #category : 'accessing - bit flags' }
PangoLogAttr >> isWordStart: aBoolean [
	"Set the bit flag on this struct.

	Automatically generated. See #compileBitAccessors in class side."

	^ self flags bitAt: 6 put: aBoolean asBit
]
