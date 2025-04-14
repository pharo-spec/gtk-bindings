"
https://docs.gtk.org/gtk4/iface.Editable.html
"
Trait {
	#name : 'GtkTEditable',
	#category : 'Gtk-Widget-Input',
	#package : 'Gtk',
	#tag : 'Widget-Input'
}

{ #category : 'selection' }
GtkTEditable >> deleteSelection [

	self ffiCall: #(void gtk_editable_delete_selection (self))
]

{ #category : 'private' }
GtkTEditable >> editable: is_editable [

	self ffiCall: #(void gtk_editable_set_editable (self, gboolean is_editable))
]

{ #category : 'testing' }
GtkTEditable >> isEditable [

	^ self ffiCall: #(gboolean gtk_editable_get_editable (self))

]

{ #category : 'accessing' }
GtkTEditable >> position: position [

	self ffiCall: #(void gtk_editable_set_position (self, gint position))
]

{ #category : 'selection' }
GtkTEditable >> selectAll [

	self selectFrom: 0 to: -1
]

{ #category : 'selection' }
GtkTEditable >> selectFrom: start_pos to: end_pos [

	^ self ffiCall: #(void gtk_editable_select_region (self, gint start_pos, gint end_pos))
]

{ #category : 'accessing' }
GtkTEditable >> text [

	self ffiCall: #(char *gtk_editable_get_text (self))
]

{ #category : 'accessing' }
GtkTEditable >> text: text [

	self ffiCall: #(void gtk_editable_set_text (self, const char* text))
]
