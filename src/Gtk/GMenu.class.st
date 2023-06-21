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

{ #category : #accessing }
GMenu >> appendItem: item [

	self basicAppendItem: item.
	item doNotAutoRelease
]

{ #category : #accessing }
GMenu >> appendLabel: label actionName: detailed_action [

	^ self ffiCall: #(void g_menu_append (self, const gchar* label, const gchar* detailed_action))
]

{ #category : #accessing }
GMenu >> appendLabel: label section: section [

	self basicAppendLabel: label section: section.
	section doNotAutoRelease

]

{ #category : #accessing }
GMenu >> appendLabel: label submenu: submenu [ 

	self basicAppendLabel: label submenu: submenu.
	submenu doNotAutoRelease
]

{ #category : #accessing }
GMenu >> appendSection: section [

	self basicAppendSection: section.
	section doNotAutoRelease
]

{ #category : #private }
GMenu >> basicAppendItem: item [
	
	self ffiCall: #(void g_menu_append_item (self, GMenuItem* item))
]

{ #category : #private }
GMenu >> basicAppendLabel: label section: section [

	self ffiCall: #(void g_menu_append_section (self, gchar *label, GMenuModel *section))
]

{ #category : #private }
GMenu >> basicAppendLabel: label submenu: submenu [ 

	self ffiCall: #(void g_menu_append_submenu (self, const gchar* label, GMenuModel* submenu))
]

{ #category : #private }
GMenu >> basicAppendSection: section [

	self ffiCall: #(void g_menu_append_item (self, NULL, GMenuModel *section))
]

{ #category : #private }
GMenu >> basicInsertAtPosition: position item: item [

	self ffiCall: #(void g_menu_insert_item (
  		self,
  		gint position,
  		GMenuItem* item))
]

{ #category : #private }
GMenu >> basicInsertAtPosition: position label: label section: section [ 

	self ffiCall: #(void g_menu_insert_section (
  		self,
  		gint position,
  		const gchar* label,
  		GMenuModel* section))
]

{ #category : #private }
GMenu >> basicInsertAtPosition: position label: label submenu: submenu [ 

	self ffiCall: #(void g_menu_insert_submenu (
  		self,
  		gint position,
  		const gchar* label,
  		GMenuModel* submenu))
]

{ #category : #accessing }
GMenu >> insertAtPosition: position item: item [

	self basicInsertAtPosition: position item: item.
	item doNotAutoRelease

]

{ #category : #accessing }
GMenu >> insertAtPosition: position label: label action: detailed_action [

	^ self ffiCall: #(void g_menu_insert (
  		self,
  		gint position,
  		const gchar* label,
  		const gchar* detailed_action))
]

{ #category : #accessing }
GMenu >> insertAtPosition: position label: label section: section [ 

	self basicInsertAtPosition: position label: label section: section.
	section doNotAutoRelease 

]

{ #category : #accessing }
GMenu >> insertAtPosition: position label: label submenu: submenu [ 

	self basicInsertAtPosition: position label: label submenu: submenu.
	submenu doNotAutoRelease

]
