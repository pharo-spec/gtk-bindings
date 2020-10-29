"
GtkPopoverMenu — Popovers to use as menus

https://developer.gnome.org/gtk3/stable/GtkPopoverMenu.html
"
Class {
	#name : #GtkPopoverMenu,
	#superclass : #GtkPopover,
	#category : #'Gtk-Widget-Toolbar'
}

{ #category : #'as yet unclassified' }
GtkPopoverMenu class >> gtkPopoverMenuNew [

	^ self ffiCall: #(GtkPopoverMenu *gtk_popover_menu_new (void))
]

{ #category : #'instance creation' }
GtkPopoverMenu class >> new [

	^ self gtkPopoverMenuNew initialize
]
