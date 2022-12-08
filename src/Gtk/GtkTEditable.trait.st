"
https://docs.gtk.org/gtk4/iface.Editable.html
"
Trait {
	#name : #GtkTEditable,
	#category : #'Gtk-Widget-Input'
}

{ #category : #private }
GtkTEditable >> editable: is_editable [

	self ffiCall: #(void gtk_editable_set_editable (self, gboolean is_editable))
]

{ #category : #testing }
GtkTEditable >> isEditable [

	^ self ffiCall: #(gboolean gtk_editable_get_editable (self))

]

{ #category : #accessing }
GtkTEditable >> text [

	self ffiCall: #(char *gtk_editable_get_text (self))
]

{ #category : #accessing }
GtkTEditable >> text: text [

	self ffiCall: #(void gtk_editable_set_text (self, const char* text))
]
