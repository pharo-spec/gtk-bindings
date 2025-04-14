"
GtkHeaderBar is a widget for creating custom title bars for windows.

https://docs.gtk.org/gtk4/class.HeaderBar.html
"
Class {
	#name : 'GtkHeaderBar',
	#superclass : 'GtkContainer',
	#traits : 'GtkTContainer',
	#classTraits : 'GtkTContainer classTrait',
	#instVars : [
		'titleWidget'
	],
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'accessing' }
GtkHeaderBar class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_header_bar_get_type())
]

{ #category : 'private' }
GtkHeaderBar class >> headerBarNew [

	^ self ffiCall: #(GtkHeaderBar *gtk_header_bar_new (void))
]

{ #category : 'instance creation' }
GtkHeaderBar class >> new [

	^ self headerBarNew initialize
]

{ #category : 'private' }
GtkHeaderBar >> basicPackEnd: aWidget [

	^ self ffiCall: #(void gtk_header_bar_pack_end (self, GtkWidget *aWidget))
]

{ #category : 'private' }
GtkHeaderBar >> basicPackStart: aWidget [

	^ self ffiCall: #(void gtk_header_bar_pack_start (self, GtkWidget *aWidget))
]

{ #category : 'private' }
GtkHeaderBar >> basicRemove: child [

	self ffiCall: #(void gtk_header_bar_remove (self, GtkWidget* child))
]

{ #category : 'accessing' }
GtkHeaderBar >> decorationLayout [

	self ffiCall: #(const char* gtk_header_bar_get_decoration_layout (self))
]

{ #category : 'accessing' }
GtkHeaderBar >> decorationLayout: layout [

	self ffiCall: #(void gtk_header_bar_set_decoration_layout (self, const char* layout))
]

{ #category : 'private' }
GtkHeaderBar >> getTitleWidget [

	^ self ffiCall: #(GtkWidget *gtk_header_bar_get_title_widget (self))
]

{ #category : 'initialization' }
GtkHeaderBar >> initialize [

	super initialize.
	self initializeTContainer
]

{ #category : 'accessing' }
GtkHeaderBar >> packEnd: aWidget [

	self keepWidget: aWidget.
	self basicPackEnd: aWidget
	
]

{ #category : 'accessing' }
GtkHeaderBar >> packStart: aWidget [

	self keepWidget: aWidget.
	self basicPackStart: aWidget
]

{ #category : 'private' }
GtkHeaderBar >> setTitleWidget: aWidget [

	^ self ffiCall: #(void gtk_header_bar_set_title_widget (self, GtkWidget *aWidget))
]

{ #category : 'accessing' }
GtkHeaderBar >> showTitleButtons: setting [

	self ffiCall: #(void gtk_header_bar_set_show_title_buttons (self, gboolean setting))

]

{ #category : 'testing' }
GtkHeaderBar >> showsTitleButtons [

	^ self ffiCall: #(gboolean gtk_header_bar_get_show_title_buttons (self))
]

{ #category : 'accessing' }
GtkHeaderBar >> titleWidget [

	^ titleWidget ifNil: [ titleWidget := self getTitleWidget ]
]

{ #category : 'accessing' }
GtkHeaderBar >> titleWidget: aWidget [

	titleWidget := aWidget.
	self setTitleWidget: aWidget
]
