"
GtkTextView — Widget that displays a GtkTextBuffer

https://developer.gnome.org/gtk3/stable/GtkTextView.html
"
Class {
	#name : 'GtkTextView',
	#superclass : 'GtkWidget',
	#traits : 'GtkTScrollable',
	#classTraits : 'GtkTScrollable classTrait',
	#instVars : [
		'textBuffer'
	],
	#pools : [
		'GtkTextWindowType',
		'GtkWrapMode'
	],
	#category : 'Gtk-Widget',
	#package : 'Gtk',
	#tag : 'Widget'
}

{ #category : 'accessing' }
GtkTextView class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_text_view_get_type())
]

{ #category : 'instance creation' }
GtkTextView class >> new [
	^ self textViewNew initialize
]

{ #category : 'private' }
GtkTextView class >> textViewNew [
	^ self ffiCall: #(GtkTextView *gtk_text_view_new (void))
]

{ #category : 'accessing' }
GtkTextView >> beWrapChar [

	self setWrapMode: GTK_WRAP_CHAR
]

{ #category : 'accessing' }
GtkTextView >> beWrapNone [

	self setWrapMode: GTK_WRAP_NONE
]

{ #category : 'accessing' }
GtkTextView >> beWrapWord [

	self setWrapMode: GTK_WRAP_WORD
]

{ #category : 'accessing' }
GtkTextView >> beWrapWordChar [

	self setWrapMode: GTK_WRAP_WORD_CHAR
]

{ #category : 'accessing' }
GtkTextView >> bottomMargin [

	self ffiCall: #(gint gtk_text_view_get_bottom_margin (self))
]

{ #category : 'accessing' }
GtkTextView >> bottomMargin: bottom_margin [

	self ffiCall: #(void gtk_text_view_set_bottom_margin (self, gint bottom_margin))
]

{ #category : 'signaling' }
GtkTextView >> connectPopulatePopup: aBlock [

	"^ (GPopulatePopupCallback do: aBlock) connectTo: self"
	self deprecated: 'Gtk4: use #extraMenu:'
]

{ #category : 'accessing' }
GtkTextView >> cursorVisible: setting [

	self ffiCall: #(void gtk_text_view_set_cursor_visible (self, gboolean setting))
]

{ #category : 'accessing' }
GtkTextView >> editable: setting [

	self ffiCall: #(void gtk_text_view_set_editable (self, gboolean setting))
]

{ #category : 'accessing' }
GtkTextView >> extraMenu: aMenuModel [

	self setExtraMenu: aMenuModel
]

{ #category : 'private' }
GtkTextView >> gdkWindowOfType: win [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkTextView >> gdkWindowText [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkTextView >> getBuffer [

	^ self ffiCall: #(GtkTextBuffer *gtk_text_view_get_buffer (self))
]

{ #category : 'private' }
GtkTextView >> getIterAtLocationX: x y: y to: iter [

	^ self ffiCall: #(gboolean gtk_text_view_get_iter_at_location (
		self,
		GtkTextIter *iter,
		gint x,
		gint y))
]

{ #category : 'private' }
GtkTextView >> getIterLocation: iter to: location [

	^ self ffiCall: #(void gtk_text_view_get_iter_location (
		self,const 
		GtkTextIter *iter,
		GdkRectangle *location))
]

{ #category : 'accessing' }
GtkTextView >> imContextFilterKeypress: event [

	^ self ffiCall: #(gboolean gtk_text_view_im_context_filter_keypress (self, #GdkKeyEvent *event))
]

{ #category : 'testing' }
GtkTextView >> isCursorVisible [

	^ self ffiCall: #(gboolean gtk_text_view_get_cursor_visible (self))
]

{ #category : 'testing' }
GtkTextView >> isEditable [
	"Returns the default editability of the GtkTextView. 
	 Tags in the buffer may override this setting for some ranges of text."
	self ffiCall: #(gboolean gtk_text_view_get_editable (self))
]

{ #category : 'accessing' }
GtkTextView >> iterAtLocation: aPoint [ 
	| iter result |
	
	iter := GtkTextIter new.
	result := self getIterAtLocationX: aPoint x y: aPoint y to: iter.
	^ result 
		ifTrue: [ iter ]
		ifFalse: [ nil ]
]

{ #category : 'accessing' }
GtkTextView >> iterLocation: iter [ 
	| rect |
	
	rect := GdkRectangle new.
	self getIterLocation: iter to: rect.
	^ rect asRectangle
]

{ #category : 'accessing' }
GtkTextView >> leftMargin [

	self ffiCall: #(gint gtk_text_view_get_left_margin (self))
]

{ #category : 'accessing' }
GtkTextView >> leftMargin: left_margin [

	self ffiCall: #(void gtk_text_view_set_left_margin (self, gint left_margin))
]

{ #category : 'accessing' }
GtkTextView >> monospace [
	
	^ self ffiCall: #(gboolean gtk_text_view_get_monospace (self))
]

{ #category : 'accessing' }
GtkTextView >> monospace: aBoolean [

	^ self ffiCall: #(void gtk_text_view_set_monospace (self, gboolean aBoolean))
]

{ #category : 'accessing' }
GtkTextView >> placeCursorOnScreen [

	^ self ffiCall: #(gboolean gtk_text_view_place_cursor_onscreen (self))
]

{ #category : 'accessing' }
GtkTextView >> rightMargin [

	self ffiCall: #(gint gtk_text_view_get_right_margin (self))
]

{ #category : 'accessing' }
GtkTextView >> rightMargin: right_margin [

	self ffiCall: #(void gtk_text_view_set_right_margin (self, gint right_margin))
]

{ #category : 'accessing' }
GtkTextView >> scrollMarkOnScreen: mark [

	^ self ffiCall: #(void gtk_text_view_scroll_mark_onscreen (self, GtkTextMark *mark))
]

{ #category : 'accessing' }
GtkTextView >> scrollToIter: iter withinMargin: within_margin useAlign: use_align xalign: xalign yalign: yalign [

	^ self ffiCall: #(gboolean gtk_text_view_scroll_to_iter (
		self,
      GtkTextIter *iter,
      gdouble within_margin,
      gboolean use_align,
      gdouble xalign,
      gdouble yalign))
]

{ #category : 'accessing' }
GtkTextView >> scrollToMark: mark withinMargin: within_margin useAlign: use_align xalign: xalign yalign: yalign [

	^ self ffiCall: #(gboolean gtk_text_view_scroll_to_mark (
		self,
      GtkTextMark *mark,
      gdouble within_margin,
      gboolean use_align,
      gdouble xalign,
      gdouble yalign))
]

{ #category : 'private' }
GtkTextView >> setBuffer: buffer [

	self ffiCall: #(void gtk_text_view_set_buffer (self, GtkTextBuffer *buffer))
]

{ #category : 'private' }
GtkTextView >> setExtraMenu: aModel [

	self ffiCall: #(void gtk_text_view_set_extra_menu (self, GMenuModel* aModel))
]

{ #category : 'private' }
GtkTextView >> setWrapMode: wrap_mode [

	^ self ffiCall: #(void gtk_text_view_set_wrap_mode (self, GtkWrapMode wrap_mode))
]

{ #category : 'accessing' }
GtkTextView >> text [

	^ self textBuffer text
]

{ #category : 'accessing' }
GtkTextView >> text: aString [

	self textBuffer text: aString
]

{ #category : 'accessing' }
GtkTextView >> textBuffer [

	^ textBuffer ifNil: [ textBuffer := self getBuffer ]
]

{ #category : 'accessing' }
GtkTextView >> textBuffer: aTextBuffer [ 

	textBuffer := aTextBuffer.
	self setBuffer: aTextBuffer.
	textBuffer objectUnrefNow
]

{ #category : 'accessing' }
GtkTextView >> topMargin [

	self ffiCall: #(gint gtk_text_view_get_top_margin (self))
]

{ #category : 'accessing' }
GtkTextView >> topMargin: top_margin [

	self ffiCall: #(void gtk_text_view_set_top_margin (self, gint top_margin))
]

{ #category : 'accessing' }
GtkTextView >> windowToBufferCoordinates: aPoint [ 
	| bufferX bufferY |
	
	bufferX := FFIInt32 newBuffer.
	bufferY := FFIInt32 newBuffer.
	self 
		windowToBufferCoordsType: GTK_TEXT_WINDOW_WIDGET 
		x: aPoint x
		y: aPoint y 
		bufferX: bufferX 
		bufferY: bufferY.
	
	^ (bufferX signedLongAt: 1)@(bufferY signedLongAt: 1)

]

{ #category : 'private' }
GtkTextView >> windowToBufferCoordsType: win x: window_x y: window_y bufferX: buffer_x bufferY: buffer_y [

	^ self ffiCall: #(void gtk_text_view_window_to_buffer_coords (
		self,
      GtkTextWindowType win,
		gint window_x,
		gint window_y,
		"gint *"void *buffer_x,
		"gint *"void *buffer_y))
]

{ #category : 'accessing' }
GtkTextView >> wrapMode [ 

	^ self ffiCall: #(GtkWrapMode gtk_text_view_get_wrap_mode(self))
]
