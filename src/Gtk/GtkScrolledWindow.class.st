"
I add scrollbars to my child widget (I accept only one)

https://docs.gtk.org/gtk4/class.ScrolledWindow.html
"
Class {
	#name : 'GtkScrolledWindow',
	#superclass : 'GtkWidget',
	#traits : 'GtkTBin',
	#classTraits : 'GtkTBin classTrait',
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'accessing' }
GtkScrolledWindow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_scrolled_window_get_type())
]

{ #category : 'instance creation' }
GtkScrolledWindow class >> new [
	^ self scrolledWindowNew initialize
]

{ #category : 'private' }
GtkScrolledWindow class >> scrolledWindowNew [
	^ self ffiCall: #(GtkScrolledWindow *gtk_scrolled_window_new (0, 0))
]

{ #category : 'private' }
GtkScrolledWindow class >> scrolledWindowNewHAdjustment: hadjustment vAdjustment: vadjustment [ 
	^ self ffiCall: #(GtkScrolledWindow *gtk_scrolled_window_new (
		GtkAdjustment *hadjustment,
		GtkAdjustment *vadjustment))
]

{ #category : 'accessing' }
GtkScrolledWindow >> captureButtonPress: capture_button_press [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkScrolledWindow >> hAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrolled_window_get_hadjustment (self))
]

{ #category : 'accessing' }
GtkScrolledWindow >> hAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrolled_window_set_hadjustment (self, GtkAdjustment *adjustment))
]

{ #category : 'accessing' }
GtkScrolledWindow >> hScrollBar [ 

	^ self ffiCall: #(#GtkScrollbar *gtk_scrolled_window_get_hscrollbar (self))
]

{ #category : 'testing' }
GtkScrolledWindow >> isCaptureButtonPress [

	self deprecated: #Gtk4
]

{ #category : 'testing' }
GtkScrolledWindow >> isKineticScrolling [

	^ self ffiCall: #(gboolean gtk_scrolled_window_get_kinetic_scrolling(self))
]

{ #category : 'testing' }
GtkScrolledWindow >> isOverlayScrolling [

	^ self ffiCall: #(gboolean gtk_scrolled_window_get_overlay_scrolling (self))
]

{ #category : 'accessing' }
GtkScrolledWindow >> kineticScrolling: kinetic_scrolling [

	^ self ffiCall: #(void gtk_scrolled_window_set_kinetic_scrolling (self, gboolean kinetic_scrolling))
]

{ #category : 'accessing' }
GtkScrolledWindow >> maxContentWidth [

	self ffiCall: #(gint gtk_scrolled_window_get_max_content_width (self))
]

{ #category : 'accessing' }
GtkScrolledWindow >> maxContentWidth: width [

	self ffiCall: #(void gtk_scrolled_window_set_max_content_width (self, gint width))
]

{ #category : 'accessing' }
GtkScrolledWindow >> minContentWidth [

	self ffiCall: #(gint gtk_scrolled_window_get_min_content_width (self))
]

{ #category : 'accessing' }
GtkScrolledWindow >> minContentWidth: width [

	self ffiCall: #(void gtk_scrolled_window_set_min_content_width (self, gint width))
]

{ #category : 'accessing' }
GtkScrolledWindow >> overlayScrolling: overlay_scrolling [

	self ffiCall: #(void gtk_scrolled_window_set_overlay_scrolling (
		self, 
		gboolean overlay_scrolling))
]

{ #category : 'accessing' }
GtkScrolledWindow >> propagateNaturalHeight: propagate [

	^ self ffiCall: #(void gtk_scrolled_window_set_propagate_natural_height(
		self,
		gboolean propagate))
]

{ #category : 'accessing' }
GtkScrolledWindow >> propagateNaturalWidth: propagate [

	^ self ffiCall: #(void gtk_scrolled_window_set_propagate_natural_width(
		self,
		gboolean propagate))
]

{ #category : 'private' }
GtkScrolledWindow >> setChild: aWidget [

	^ self ffiCall: #(void gtk_scrolled_window_set_child (self, GtkWidget* aWidget))
]

{ #category : 'accessing' }
GtkScrolledWindow >> vAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrolled_window_get_vadjustment (self))
]

{ #category : 'accessing' }
GtkScrolledWindow >> vAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrolled_window_set_vadjustment (self, GtkAdjustment *adjustment))
]

{ #category : 'accessing' }
GtkScrolledWindow >> vScrollBar [ 

	^ self ffiCall: #(#GtkScrollbar *gtk_scrolled_window_get_vscrollbar (self))
]
