"
https://docs.gtk.org/gio/iface.Action.html
"
Trait {
	#name : 'GTAction',
	#category : 'Gtk-Widget-Menu',
	#package : 'Gtk',
	#tag : 'Widget-Menu'
}

{ #category : 'private' }
GTAction >> basicState [

	^ self ffiCall: #(GVariant* g_action_get_state (self))
]

{ #category : 'private' }
GTAction >> changeState: value [

	self ffiCall: #(void g_action_change_state (self, GVariant* value))
]

{ #category : 'private' }
GTAction >> getState [

	^ self ffiCall: #(GVariant* g_action_get_state (self))
]

{ #category : 'accessing' }
GTAction >> name [

	^ self ffiCall: #(const gchar* g_action_get_name (self))
]

{ #category : 'accessing' }
GTAction >> state [
	| variant value |
	
	variant := self getState.
	value := variant getBoolean.
	variant unref.
	
	^ value
	
]

{ #category : 'accessing' }
GTAction >> state: aBoolean [
	| variant |
	
	variant := GVariant newBoolean: aBoolean.
	self changeState: variant.
	"variant unref"
]
