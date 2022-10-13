"
https://docs.gtk.org/gio/class.Menu.html
"
Class {
	#name : #GMenu,
	#superclass : #GMenuModel,
	#category : #'Gtk-Widget-Menu'
}

{ #category : #private }
GMenu class >> gNew [

	self ffiCall: #(GMenu* g_menu_new (void))
]

{ #category : #'instance creation' }
GMenu class >> new [

	^ self gNew initialize
]

{ #category : #'as yet unclassified' }
GMenu >> appendItem: item [

	^ self ffiCall: #(void g_menu_append_item (self, GMenuItem* item))
]

{ #category : #'as yet unclassified' }
GMenu >> appendLabel: label action: detailed_action [

	^ self ffiCall: #(void g_menu_append (self, const gchar* label, const gchar* detailed_action))
]

{ #category : #'as yet unclassified' }
GMenu >> appendLabel: label section: section [ 

	^ self ffiCall: #(void g_menu_append_section (self, const gchar* label, GMenuModel* section))
]

{ #category : #'as yet unclassified' }
GMenu >> appendLabel: label submenu: submenu [ 

	^ self ffiCall: #(void g_menu_append_submenu (self, const gchar* label, GMenuModel* submenu))
]

{ #category : #'as yet unclassified' }
GMenu >> insertAtPosition: position item: item [

	^ self ffiCall: #(void g_menu_insert_item (
  		self,
  		gint position,
  		GMenuItem* item))
]

{ #category : #'as yet unclassified' }
GMenu >> insertAtPosition: position label: label action: detailed_action [

	^ self ffiCall: #(void g_menu_insert (
  		self,
  		gint position,
  		const gchar* label,
  		const gchar* detailed_action))
]

{ #category : #'as yet unclassified' }
GMenu >> insertAtPosition: position label: label section: section [ 

	^ self ffiCall: #(void g_menu_insert_section (
  		self,
  		gint position,
  		const gchar* label,
  		GMenuModel* section))
]

{ #category : #'as yet unclassified' }
GMenu >> insertAtPosition: position label: label submenu: section [ 

	^ self ffiCall: #(void g_menu_insert_submenu (
  		self,
  		gint position,
  		const gchar* label,
  		GMenuModel* submenu))
]
