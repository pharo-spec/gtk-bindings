"
https://docs.gtk.org/gio/iface.Action.html
"
Trait {
	#name : 'GTAction',
	#category : 'Gtk-Widget-Menu',
	#package : 'Gtk',
	#tag : 'Widget-Menu'
}

{ #category : 'accessing' }
GTAction >> name [

	^ self ffiCall: #(const gchar* g_action_get_name (self))
]
