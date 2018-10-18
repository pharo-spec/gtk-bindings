"
GtkMenu — A menu widget

https://developer.gnome.org/gtk3/stable/GtkMenu.html
"
Class {
	#name : #GtkMenu,
	#superclass : #GtkMenuShell,
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #private }
GtkMenu class >> menuNew [ 

	^ self ffiCall: #(GtkMenu *gtk_menu_new (void))
]

{ #category : #'instance creation' }
GtkMenu class >> new [

	^ self menuNew initialize
]

{ #category : #initialization }
GtkMenu >> initialize [ 
	super initialize.
	self reserveToggleSize: false
]

{ #category : #testing }
GtkMenu >> isReserveToggleSize [

	^ self ffiCall: #(gboolean gtk_menu_get_reserve_toggle_size (self))
]

{ #category : #accessing }
GtkMenu >> reserveToggleSize: reserve_toggle_size [

	self ffiCall: #(void gtk_menu_set_reserve_toggle_size (
		self,
		gboolean reserve_toggle_size))
]

{ #category : #accessing }
GtkMenu >> title [

	^ self ffiCall: #(const gchar *gtk_menu_get_title (self))
]

{ #category : #accessing }
GtkMenu >> title: title [

	^ self ffiCall: #(void gtk_menu_set_title (self, const gchar *title))
]