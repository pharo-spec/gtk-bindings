"
https://docs.gtk.org/gtk4/iface.Root.html
"
Trait {
	#name : 'GtkTRoot',
	#category : 'Gtk-Widget',
	#package : 'Gtk',
	#tag : 'Widget'
}

{ #category : 'accessing' }
GtkTRoot >> display [

	^ self ffiCall: #(GdkDisplay *gtk_root_get_display (self))
]

{ #category : 'accessing' }
GtkTRoot >> focus [

	^ self ffiCall: #(GtkWidget *gtk_root_get_focus (self))
]

{ #category : 'accessing' }
GtkTRoot >> focus: focus [

	^ self ffiCall: #(void gtk_root_set_focus (self, GtkWidget *focus))
]
