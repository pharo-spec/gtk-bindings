"
https://docs.gtk.org/gtk4/class.Tooltip.html

NOTE: apparently this component is not created by us (for the moment at least).
If we need to include a new, we will need to use `GObject class>>gObjectNew:` and all that.
"
Class {
	#name : 'GtkTooltip',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'accessing' }
GtkTooltip >> markup: markup [

	self ffiCall: #(void gtk_tooltip_set_markup (self, const char* markup))
]

{ #category : 'accessing' }
GtkTooltip >> setCustom: custom_widget [

	self ffiCall: #(void gtk_tooltip_set_custom (self, GtkWidget* custom_widget))
]

{ #category : 'accessing' }
GtkTooltip >> text: text [

	self ffiCall: #(void gtk_tooltip_set_text (self, const char* text))
]
