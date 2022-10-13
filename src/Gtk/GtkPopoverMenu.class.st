"
GtkPopoverMenu — Popovers to use as menus

https://developer.gnome.org/gtk3/stable/GtkPopoverMenu.html
"
Class {
	#name : #GtkPopoverMenu,
	#superclass : #GtkPopover,
	#instVars : [
		'menuModel'
	],
	#category : #'Gtk-Widget-Menu'
}

{ #category : #private }
GtkPopoverMenu class >> gtkNew [

	^ self ffiCall: #(GtkPopoverMenu *gtk_popover_menu_new_from_model (NULL))
]

{ #category : #private }
GtkPopoverMenu class >> gtkNewFromModel: model [

	^ self ffiCall: #(GtkPopoverMenu *gtk_popover_menu_new_from_model (GMenuModel* model))
]

{ #category : #'instance creation' }
GtkPopoverMenu class >> new [

	^ self gtkNew initialize
]

{ #category : #'instance creation' }
GtkPopoverMenu class >> newFromModel: aModel [

	^ (self gtkNewFromModel: aModel) 
		initializeModel: aModel;
		yourself
]

{ #category : #initialization }
GtkPopoverMenu >> autoObjectUnref [

	self autoRelease
]

{ #category : #private }
GtkPopoverMenu >> getMenuModel [

	^ self ffiCall: #(GMenuModel* gtk_popover_menu_get_menu_model (self))
]

{ #category : #initialization }
GtkPopoverMenu >> initializeModel: aModel [

	self initialize.	
	menuModel := aModel
]

{ #category : #accessing }
GtkPopoverMenu >> menuModel [

	^ menuModel ifNil: [ menuModel := self getMenuModel ]
]

{ #category : #accessing }
GtkPopoverMenu >> menuModel: aModel [

	menuModel := aModel.
	self setMenuModel: aModel
]

{ #category : #private }
GtkPopoverMenu >> setMenuModel: model [

	self ffiCall: #(void gtk_popover_menu_set_menu_model (self, GMenuModel* model))
]
