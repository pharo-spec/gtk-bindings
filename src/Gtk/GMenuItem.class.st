"
https://docs.gtk.org/gio/class.MenuItem.html
"
Class {
	#name : 'GMenuItem',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gtk-Widget-Menu',
	#package : 'Gtk',
	#tag : 'Widget-Menu'
}

{ #category : 'private' }
GMenuItem class >> gNew [

	^ self ffiCall: #(GMenuItem* g_menu_item_new (NULL, NULL))
]

{ #category : 'private' }
GMenuItem class >> gNew: label [ 

	^ self ffiCall: #(GMenuItem* g_menu_item_new (const gchar* label, NULL))
]

{ #category : 'private' }
GMenuItem class >> gNew: label action: detailed_action [ 

	^ self ffiCall: #(GMenuItem* g_menu_item_new (
  		const gchar* label,
  		const gchar* detailed_action))
]

{ #category : 'instance creation' }
GMenuItem class >> new [

	^ self gNew initialize
]

{ #category : 'instance creation' }
GMenuItem class >> newLabel: aString [

	^ (self gNew: aString) initialize
]

{ #category : 'instance creation' }
GMenuItem class >> newLabel: aString action: actionString [

	^ (self gNew: aString action: actionString) initialize
]

{ #category : 'accessing' }
GMenuItem >> accel: aString [

	self attributeAt: 'accel' put: aString
]

{ #category : 'accessing' }
GMenuItem >> attributeAt: attribute put: format_string [

	self ffiCall: #(void
g_menu_item_set_attribute (
  self,
  const gchar* attribute,
  const gchar* format_string,
  NULL
))
]

{ #category : 'accessing' }
GMenuItem >> detailedAction: detailed_action [

	self ffiCall: #(void g_menu_item_set_detailed_action (self, const gchar* detailed_action))
]

{ #category : 'accessing' }
GMenuItem >> icon: icon [

	self ffiCall: #(void g_menu_item_set_icon (self, GIcon* icon))
]

{ #category : 'accessing' }
GMenuItem >> label: label [

	self ffiCall: #(void g_menu_item_set_label (self, const gchar* label))

]

{ #category : 'accessing' }
GMenuItem >> subMenu: submenu [

	self ffiCall: #(void g_menu_item_set_submenu (self, GMenuModel* submenu))
]
