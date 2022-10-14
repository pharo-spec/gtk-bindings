"
https://docs.gtk.org/gio/class.MenuItem.html
"
Class {
	#name : #GMenuItem,
	#superclass : #GObject,
	#category : #'Gtk-Widget-Menu'
}

{ #category : #private }
GMenuItem class >> gNew [

	^ self ffiCall: #(GMenuItem* g_menu_item_new (NULL, NULL))
]

{ #category : #private }
GMenuItem class >> gNew: label [ 

	^ self ffiCall: #(GMenuItem* g_menu_item_new (const gchar* label, NULL))
]

{ #category : #private }
GMenuItem class >> gNew: label action: detailed_action [ 

	^ self ffiCall: #(GMenuItem* g_menu_item_new (
  		const gchar* label,
  		const gchar* detailed_action))
]

{ #category : #'instance creation' }
GMenuItem class >> new [

	^ self gNew initialize
]

{ #category : #'instance creation' }
GMenuItem class >> newLabel: aString [

	^ (self gNew: aString) initialize
]

{ #category : #'instance creation' }
GMenuItem class >> newLabel: aString action: actionString [

	^ (self gNew: aString action: actionString) initialize
]

{ #category : #'as yet unclassified' }
GMenuItem >> detailedAction: detailed_action [

	self ffiCall: #(void g_menu_item_set_detailed_action (self, const gchar* detailed_action))
]

{ #category : #accessing }
GMenuItem >> icon: icon [

	self ffiCall: #(void g_menu_item_set_icon (self, GIcon* icon))
]

{ #category : #accessing }
GMenuItem >> label: label [

	self ffiCall: #(void g_menu_item_set_label (self, const gchar* label))

]
