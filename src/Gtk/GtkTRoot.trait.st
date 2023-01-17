"
https://docs.gtk.org/gtk4/iface.Root.html
"
Trait {
	#name : #GtkTRoot,
	#category : #'Gtk-Widget'
}

{ #category : #api }
GtkTRoot >> display [

	^ self ffiCall: #(GdkDisplay *gtk_root_get_display (self))
]

{ #category : #api }
GtkTRoot >> getFocus [

	^ self ffiCall: #(GtkWidget *gtk_root_get_focus (self))
]

{ #category : #api }
GtkTRoot >> setFocus: focus [

	^ self ffiCall: #(void gtk_root_set_focus (self, GtkWidget *focus))
]
