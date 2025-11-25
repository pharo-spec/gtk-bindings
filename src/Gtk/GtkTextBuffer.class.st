"
# GtkTextView

I store attributed text for display in a GtkTextView.

https://developer.gnome.org/gtk3/stable/GtkTextBuffer.html
"
Class {
	#name : 'GtkTextBuffer',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'tagTable'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'accessing' }
GtkTextBuffer class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_text_buffer_get_type())
]

{ #category : 'instance creation' }
GtkTextBuffer class >> newTable: table [ 

	^ (self textBufferNew: table) initializeTable: table
]

{ #category : 'private' }
GtkTextBuffer class >> textBufferNew: table [

	^ self ffiCall: #(GtkTextBuffer *gtk_text_buffer_new (GtkTextTagTable *table))
]

{ #category : 'accessing' }
GtkTextBuffer >> appendMarkup: aString [

	self 
		insertMarkupIter: self endIter 
		text: aString
]

{ #category : 'accessing' }
GtkTextBuffer >> appendText: aString [

	self 
		insertIter: self endIter 
		text: aString
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> applyTag: aTag start: start end: end [
	| startIter endIter |
	
	startIter := self iterAtOffset: start.
	endIter := self iterAtOffset: end.
	self applyTag: aTag startIter: startIter endIter: endIter
	
	
]

{ #category : 'private' }
GtkTextBuffer >> applyTag: tag startIter: start endIter: end [

	self ffiCall: #(void gtk_text_buffer_apply_tag (
		self,
 		GtkTextTag *tag,
		const GtkTextIter *start,
		const GtkTextIter *end))
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> applyTagByName: aName start: start end: end [
	| startIter endIter |
	
	startIter := self iterAtOffset: start.
	endIter := self iterAtOffset: end.
	self 
		applyTagByName: aName 
		startIter: startIter 
		endIter: endIter
]

{ #category : 'private' }
GtkTextBuffer >> applyTagByName: name startIter: start endIter: end [

	self ffiCall: #(void gtk_text_buffer_apply_tag_by_name (
		self,
 		const gchar *name,
		const GtkTextIter *start,
		const GtkTextIter *end))
]

{ #category : 'private' }
GtkTextBuffer >> beginUserAction [
	
	self ffiCall: #(void gtk_text_buffer_begin_user_action (self))
]

{ #category : 'testing' }
GtkTextBuffer >> canRedo [

	^ self ffiCall: #(gboolean gtk_text_buffer_get_can_redo(self))
]

{ #category : 'testing' }
GtkTextBuffer >> canUndo [

	^ self ffiCall: #(gboolean gtk_text_buffer_get_can_undo(self))
]

{ #category : 'accessing' }
GtkTextBuffer >> charCount [

	^ self ffiCall: #(gint gtk_text_buffer_get_char_count (self))
]

{ #category : 'signals' }
GtkTextBuffer >> connectChanged: aBlock [ 

	(GChangedCallback do: aBlock) connectTo: self
]

{ #category : 'signals' }
GtkTextBuffer >> connectMarkSet: aBlock [

	self 
		connect: 'mark-set' 
		signature: #(void (void *textBuffer, void *iter, void *mark, gpointer data))
		do: [ :textBuffer :iter :mark :data | 
			aBlock 
				value: (GtkTextIter fromHandle: iter)
				value: (GtkTextMark fromHandle: mark) ]	
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> createAnonymousTag [

	^ self ffiCall: #(GtkTextTag *gtk_text_buffer_create_tag (self, NULL, NULL))
]

{ #category : 'accessing - mark' }
GtkTextBuffer >> createMarkNamed: mark_name where: where leftGravity: left_gravity [

	^ self ffiCall: #(GtkTextMark *gtk_text_buffer_create_mark (
			self,
			const gchar *mark_name,
			const GtkTextIter *where,
			gboolean left_gravity))
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> createTag: tag_name [

	^ self ffiCall: #(GtkTextTag *gtk_text_buffer_create_tag (self, gchar *tag_name, NULL))
]

{ #category : 'accessing' }
GtkTextBuffer >> cursorPosition [

	^ self gObjectGetInteger: 'cursor-position'
]

{ #category : 'accessing' }
GtkTextBuffer >> cursorPosition: index [
	| indexIter |

	indexIter := self iterAtOffset: index.
	self placeCursor: indexIter
]

{ #category : 'accessing' }
GtkTextBuffer >> cursorPositionAtLine [
	| iter |
	
	iter := GtkTextIter new.
	self offsetIter: iter pos: self cursorPosition.
	^ (iter lineOffset + 1) @ (iter line + 1)
]

{ #category : 'accessing' }
GtkTextBuffer >> deleteAll [ 

	self 
		deleteStart: self startIter 
		end: self endIter
]

{ #category : 'accessing - mark' }
GtkTextBuffer >> deleteMark: mark [

	self ffiCall: #(void gtk_text_buffer_delete_mark (self, GtkTextMark* mark))
]

{ #category : 'private' }
GtkTextBuffer >> deleteStart: start end: end [

	^ self ffiCall: #(void gtk_text_buffer_delete (self, GtkTextIter *start, GtkTextIter *end))
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> disableUndo [

	self undoEnabled: false
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> enableUndo [

	self undoEnabled: true
]

{ #category : 'private' }
GtkTextBuffer >> endIter [ 
	| end |

	end := GtkTextIter new.
	self endIter: end.
	^ end
	
]

{ #category : 'private' }
GtkTextBuffer >> endIter: iter [

	self ffiCall: #(void gtk_text_buffer_get_end_iter (self, GtkTextIter *iter))
]

{ #category : 'private' }
GtkTextBuffer >> endUserAction [
	
	self ffiCall: #(void gtk_text_buffer_end_user_action (self))
]

{ #category : 'private' }
GtkTextBuffer >> getIter: iter atLine: line_number [ 

	self ffiCall: #(void gtk_text_buffer_get_iter_at_line (
		self,
		GtkTextIter *iter, 
		gint line_number))
]

{ #category : 'private' }
GtkTextBuffer >> getIter: iter atMark: mark [

	self ffiCall: #(void gtk_text_buffer_get_iter_at_mark (
		self,
		GtkTextIter *iter,
		GtkTextMark *mark))
]

{ #category : 'private' }
GtkTextBuffer >> getSelectionBoundsStart: start end: end [ 

	^ self ffiCall: #(gboolean gtk_text_buffer_get_selection_bounds (
		self,
		GtkTextIter *start,
		GtkTextIter *end))
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> infiniteUndoLevels [

	self maxUndoLevels: 0
]

{ #category : 'initialization' }
GtkTextBuffer >> initializeTable: aTagTable [

	tagTable := aTagTable.
	self initialize
]

{ #category : 'private' }
GtkTextBuffer >> insertIter: iter text: text [

	^ self ffiCall: #(void gtk_text_buffer_insert (self,
                        GtkTextIter *iter,
                        const gchar *text,
                        gint -1))
]

{ #category : 'accessing - mark' }
GtkTextBuffer >> insertMark [

	^ self ffiCall: #(GtkTextMark *gtk_text_buffer_get_insert (self))
]

{ #category : 'accessing' }
GtkTextBuffer >> insertMarkup: aString [

	self 
		insertMarkupIter: self startIter 
		text: aString
]

{ #category : 'private' }
GtkTextBuffer >> insertMarkupIter: iter text: text [

	^ self ffiCall: #(void gtk_text_buffer_insert_markup (
		self,
		GtkTextIter *iter,
		const gchar *text,
		gint -1))
]

{ #category : 'accessing' }
GtkTextBuffer >> insertText: aString [

	self 
		insertIter: self startIter 
		text: aString
]

{ #category : 'accessing' }
GtkTextBuffer >> insertText: aString at: offset [

	self 
		insertIter: (self iterAtOffset: offset)
		text: aString
]

{ #category : 'accessing' }
GtkTextBuffer >> insertTextAtCursor: text [

	^ self ffiCall: #(void gtk_text_buffer_insert_at_cursor (self, const gchar *text, -1))
]

{ #category : 'testing' }
GtkTextBuffer >> isUndoEnabled [

	^ self ffiCall: #(gboolean gtk_text_buffer_get_enable_undo (self))
]

{ #category : 'accessing' }
GtkTextBuffer >> iterAtCursorPosition [

	^ self iterAtOffset: self cursorPosition
]

{ #category : 'accessing' }
GtkTextBuffer >> iterAtLine: lineNumber [
	| iter |
	
	iter := GtkTextIter new.
	self getIter: iter atLine: lineNumber.
	^ iter
]

{ #category : 'accessing' }
GtkTextBuffer >> iterAtMark: aMark [
	| iter |
	
	iter := GtkTextIter new.
	self getIter: iter atMark: aMark.
	^ iter
]

{ #category : 'accessing' }
GtkTextBuffer >> iterAtOffset: offset [
	| iter |
	
	iter := GtkTextIter new.
	self offsetIter: iter pos: offset.
	^ iter
	
]

{ #category : 'accessing' }
GtkTextBuffer >> lineAt: offset [
	| start end |
	
	start := self iterAtOffset: offset.
	start backwardChars: start lineOffset.

	end := self iterAtOffset: start offset.
	end forwardToLineEnd.
		
	^ self 
		textStart: start 
		end: end
		includeHiddenChars: false
]

{ #category : 'accessing' }
GtkTextBuffer >> lineAtCursorPosition [
	
	^ self lineAt: self cursorPosition
]

{ #category : 'accessing' }
GtkTextBuffer >> lineCount [

	^ self ffiCall: #(gint gtk_text_buffer_get_line_count (self))
]

{ #category : 'accessing - mark' }
GtkTextBuffer >> markNamed: aName [

	^ self ffiCall: #(GtkTextMark *gtk_text_buffer_get_mark (self, const gchar *aName))
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> maxUndoLevels [

	self ffiCall: #(guint gtk_text_buffer_get_max_undo_levels (self))
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> maxUndoLevels: max_undo_levels [

	^ self
		ffiCall: #(void gtk_text_buffer_set_max_undo_levels (
			self,
   			gint max_undo_levels))
]

{ #category : 'accessing - mark' }
GtkTextBuffer >> moveMark: mark to: where [

	^ self ffiCall: #(void gtk_text_buffer_move_mark (
		self,
		GtkTextMark *mark,
		const GtkTextIter *where))
]

{ #category : 'private' }
GtkTextBuffer >> offsetIter: iter pos: char_offset [
	
	^ self ffiCall: #(void gtk_text_buffer_get_iter_at_offset (self, GtkTextIter *iter, gint char_offset))
	
]

{ #category : 'accessing - selection' }
GtkTextBuffer >> placeCursor: where [

	self ffiCall: #(void gtk_text_buffer_place_cursor (self, const GtkTextIter *where))
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> redo [

	^ self ffiCall: #(void gtk_text_buffer_redo (self))
]

{ #category : 'private' }
GtkTextBuffer >> registerSerializeTagSet [

	self deprecated: #Gtk4
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> removeAllTags [ 

	self 
		removeAllTagsStartIter: self startIter 
		endIter: self endIter
]

{ #category : 'private' }
GtkTextBuffer >> removeAllTagsStartIter: start endIter: end [

	self ffiCall: #(void gtk_text_buffer_remove_all_tags (
		self, 
		const GtkTextIter *start, 
		const GtkTextIter *end))
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> removeTag: aTag [ 
	
	self 
		removeTag: aTag 
		startIter: self startIter 
		endIter: self endIter
]

{ #category : 'private' }
GtkTextBuffer >> removeTag: tag startIter: start endIter: end [

	self ffiCall: #(void gtk_text_buffer_remove_tag (
		self, 
		GtkTextTag *tag,
		const GtkTextIter *start, 
		const GtkTextIter *end))
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> removeTagByName: aName [

	self 
		removeTagByName: aName 
		startIter: self startIter 
		endIter: self endIter
]

{ #category : 'private' }
GtkTextBuffer >> removeTagByName: name startIter: start endIter: end [

	self ffiCall: #(void gtk_text_buffer_remove_tag_by_name (
		self, 
		const gchar *name,
		const GtkTextIter *start, 
		const GtkTextIter *end))
]

{ #category : 'accessing - selection' }
GtkTextBuffer >> selectAll [

	self 
		selectRangeInsert: self startIter 
		bound: self endIter
]

{ #category : 'accessing - selection' }
GtkTextBuffer >> selectFrom: start to: end [
	| startIter endIter |

	startIter := self iterAtOffset: start.
	start = end ifTrue: [ 
		self placeCursor: startIter.
		^ self ].
	endIter := self iterAtOffset: end.
	self selectRangeInsert: startIter bound: endIter
]

{ #category : 'accessing - selection' }
GtkTextBuffer >> selectLineAt: offset [
	| start end |
	
	start := self iterAtOffset: offset.
	start backwardChars: start lineOffset.

	end := self iterAtOffset: start offset.
	end forwardToLineEnd.
		
	self selectRangeInsert: start bound: end
]

{ #category : 'accessing - selection' }
GtkTextBuffer >> selectLineAtCursor [

	self selectLineAt: self cursorPosition
]

{ #category : 'private' }
GtkTextBuffer >> selectRangeInsert: ins bound: bound [

	self ffiCall: #(void gtk_text_buffer_select_range (
		self,
		const GtkTextIter *ins,
		const GtkTextIter *bound))
]

{ #category : 'accessing - selection' }
GtkTextBuffer >> selection [ 
	"answer an interval of current selection"

	^ self 
		selectionIteratorsDo: [ :start :end | start offset to: end offset ] 
		ifNone: [ nil ]
]

{ #category : 'accessing - selection' }
GtkTextBuffer >> selectionIteratorsDo: aBlock ifNone: noneBlock [
	"answer an interval of current selection"
	| start end |

	start := GtkTextIter new.
	end := GtkTextIter new.
	^ (self getSelectionBoundsStart: start end: end)
		ifTrue: [ aBlock value: start value: end ]
		ifFalse: noneBlock	
]

{ #category : 'serializing' }
GtkTextBuffer >> serialize [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkTextBuffer >> serializeFormat: format start: start end: end length: length [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkTextBuffer >> startIter [ 
	| start |

	start := GtkTextIter new.
	self startIter: start.
	^ start
	
	
]

{ #category : 'private' }
GtkTextBuffer >> startIter: iter [

	self ffiCall: #(void gtk_text_buffer_get_start_iter (self, GtkTextIter *iter))
]

{ #category : 'accessing - tags' }
GtkTextBuffer >> tagsWithRange [
	"Answer a collection with all tags in text buffer and their ranges. 
	 Useful for serializing purposes"
	| pos iter atEnd tagsWithRange |
	
	tagsWithRange := OrderedDictionary new.
	iter := self startIter.
	pos := 1.
	atEnd := false.
	[ atEnd ] whileFalse: [ 
		iter tags do: [ :eachTag | 
			(tagsWithRange 
				at: eachTag getHandle asInteger 
				ifAbsentPut: [ GtkTagRange newTag: eachTag ])
				updatePosition: pos ].
		pos := pos + 1.
		atEnd := iter forwardChar not ].

	^ tagsWithRange values
]

{ #category : 'accessing' }
GtkTextBuffer >> text [

	^ self 
		textStart: self startIter 
		end: self endIter
		includeHiddenChars: true
]

{ #category : 'accessing' }
GtkTextBuffer >> text: text [

	self ffiCall: #(void gtk_text_buffer_set_text (self, char *text, "gint len" -1))
]

{ #category : 'accessing' }
GtkTextBuffer >> textFrom: start to: end [
	| startIter endIter |

	startIter := self iterAtOffset: start.
	endIter := self iterAtOffset: end.
	^ self 
		textStart: self startIter 
		end: self endIter
		includeHiddenChars: false
]

{ #category : 'private' }
GtkTextBuffer >> textStart: start end: end includeHiddenChars: include_hidden_chars [ 

	self ffiCall: #(String gtk_text_buffer_get_text (
		self,
      const GtkTextIter *start,
      const GtkTextIter *end,
      gboolean include_hidden_chars))
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> undo [

	^ self ffiCall: #(void gtk_text_buffer_undo (self))
]

{ #category : 'accessing - undo/redo' }
GtkTextBuffer >> undoEnabled: enable_undo [

	self ffiCall: #(void gtk_text_buffer_set_enable_undo (self, gboolean enable_undo))
]

{ #category : 'accessing' }
GtkTextBuffer >> userActionDuring: aBlock [ 

	self beginUserAction.
	aBlock ensure: [ 
		self endUserAction ]
]
