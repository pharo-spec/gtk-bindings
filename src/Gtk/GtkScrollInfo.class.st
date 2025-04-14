"
https://docs.gtk.org/gtk4/struct.ScrollInfo.html
"
Class {
	#name : 'GtkScrollInfo',
	#superclass : 'GBaseObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkScrollInfo class >> gtkNew [

	^ self ffiCall: #(GtkScrollInfo* gtk_scroll_info_new (void))
]

{ #category : 'instance creation' }
GtkScrollInfo class >> new [

	^ self gtkNew initialize
]

{ #category : 'accessing' }
GtkScrollInfo >> enableHorizontal: horizontal [
	
	self ffiCall: #(void gtk_scroll_info_set_enable_horizontal (self, gboolean horizontal))
]

{ #category : 'accessing' }
GtkScrollInfo >> enableVertical: vertical [
	
	self ffiCall: #(void gtk_scroll_info_set_enable_vertical (self, gboolean vertical))
]

{ #category : 'testing' }
GtkScrollInfo >> isEnableHorizontal [

	^ self ffiCall: #(gboolean gtk_scroll_info_get_enable_horizontal (self))
]

{ #category : 'testing' }
GtkScrollInfo >> isEnableVertical [

	^ self ffiCall: #(gboolean gtk_scroll_info_get_enable_vertical (self))
]

{ #category : 'accessing - referencing' }
GtkScrollInfo >> ref [

	^ self ffiCall: #(GtkScrollInfo* gtk_scroll_info_ref (self))
]

{ #category : 'accessing - referencing' }
GtkScrollInfo >> unref [

	self ffiCall: #(void gtk_scroll_info_unref (self))
]
