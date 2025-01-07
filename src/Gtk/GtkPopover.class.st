"
GtkPopover
GtkPopover — Context dependent bubbles

https://docs.gtk.org/gtk4/class.Popover.html
"
Class {
	#name : 'GtkPopover',
	#superclass : 'GtkWidget',
	#traits : 'GtkTBin',
	#classTraits : 'GtkTBin classTrait',
	#pools : [
		'GtkPositionType'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'accessing' }
GtkPopover class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_popover_get_type())
]

{ #category : 'private' }
GtkPopover class >> gtkPopoverNewRelativeTo: relative_to model: model [

	self deprecated: #Gtk4
]

{ #category : 'instance creation' }
GtkPopover class >> new [

	^ self newRelativeTo: GtkWidget null
]

{ #category : 'instance creation' }
GtkPopover class >> newFromModel: model [

	self deprecated: #Gtk4
]

{ #category : 'instance creation' }
GtkPopover class >> newRelativeTo: aWidget [

	^ (self popoverNewRelativeTo: aWidget) initialize
]

{ #category : 'instance creation' }
GtkPopover class >> newRelativeTo: aWidget model: model [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkPopover class >> popoverNewRelativeTo: aWidget [

	^ self ffiCall: #(GtkPopover *gtk_popover_new (GtkWidget *aWidget))
]

{ #category : 'accessing' }
GtkPopover >> autohide: autohide [

	self ffiCall: #(void gtk_popover_set_autohide (self, gboolean autohide))
]

{ #category : 'accessing' }
GtkPopover >> bePositionBottom [

	self position: GTK_POS_BOTTOM
]

{ #category : 'accessing' }
GtkPopover >> bePositionLeft [

	self position: GTK_POS_LEFT
]

{ #category : 'accessing' }
GtkPopover >> bePositionRight [

	self position: GTK_POS_RIGHT
]

{ #category : 'accessing' }
GtkPopover >> bePositionTop [

	self position: GTK_POS_TOP
]

{ #category : 'accessing' }
GtkPopover >> beRelativeTo: aWidget [

	self flag: #REMOVEME.
	self error: 'Not anymore posible'
]

{ #category : 'signaling' }
GtkPopover >> connectClosed: aBlock [

	(GPopoverClosedCallback do: aBlock) connectTo: self
]

{ #category : 'accessing' }
GtkPopover >> defaultWidget [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkPopover >> defaultWidget: aWidget [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkPopover >> getDefaultWidget [

	self deprecated: #Gtk4
]

{ #category : 'testing' }
GtkPopover >> hasArrow [

	^ self ffiCall: #(gboolean gtk_popover_get_has_arrow (self))
]

{ #category : 'accessing' }
GtkPopover >> hasArrow: has_arrow [

	self ffiCall: #(void gtk_popover_set_has_arrow (self, gboolean has_arrow))
]

{ #category : 'testing' }
GtkPopover >> isAutohide [

	^ self ffiCall: #(gboolean gtk_popover_get_autohide (self))

]

{ #category : 'accessing' }
GtkPopover >> offset: aPoint [ 

	self setOffsetX: aPoint x y: aPoint y
]

{ #category : 'accessing' }
GtkPopover >> pointingTo: aRect [

	self setPointingTo: aRect asGdkRectangle
]

{ #category : 'accessing' }
GtkPopover >> popdown [

	^ self ffiCall: #(void gtk_popover_popdown (self))
]

{ #category : 'accessing' }
GtkPopover >> popup [

	^ self ffiCall: #(void gtk_popover_popup (self))
]

{ #category : 'accessing' }
GtkPopover >> position [

	^ self ffiCall: #(GtkPositionType gtk_popover_get_position (self))
]

{ #category : 'accessing' }
GtkPopover >> position: position [

	^ self ffiCall: #(void gtk_popover_set_position (self, GtkPositionType position))
]

{ #category : 'accessing' }
GtkPopover >> present [

	self ffiCall: #(void gtk_popover_present (self))
]

{ #category : 'accessing' }
GtkPopover >> relativeWidget [

	self flag: #REMOVEME.
	self error: 'Not anymore posible'
]

{ #category : 'private' }
GtkPopover >> setChild: aWidget [

	self ffiCall: #(void gtk_popover_set_child (self, GtkWidget* aWidget))
]

{ #category : 'private' }
GtkPopover >> setDefaultWidget: aWidget [

	^ self ffiCall: #(void gtk_popover_set_default_widget (self, GtkWidget *aWidget))
]

{ #category : 'private' }
GtkPopover >> setOffsetX: x_offset y: y_offset [

	self ffiCall: #(void gtk_popover_set_offset (self, int x_offset, int y_offset))
]

{ #category : 'private' }
GtkPopover >> setPointingTo: rect [

	^ self ffiCall: #(void gtk_popover_set_pointing_to (self, const GdkRectangle *rect))
]
