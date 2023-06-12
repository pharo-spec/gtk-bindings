"
https://docs.gtk.org/gtk4/class.PopoverMenuBar.html
"
Class {
	#name : #GtkPopoverMenuBar,
	#superclass : #GtkWidget,
	#traits : 'GtkTContainer',
	#classTraits : 'GtkTContainer classTrait',
	#instVars : [
		'menuModel'
	],
	#category : #'Gtk-Widget-Menu'
}

{ #category : #examples }
GtkPopoverMenuBar class >> example [

	GtkEngine ensureRunning.
	GRunLoop defer: [
		| menuModel |
		
		menuModel := GMenu new
			appendItem: (GMenuItem newLabel: 'Test');
			appendLabel: 'Test2' submenu: (GMenu new 
				appendItem: (GMenuItem newLabel: 'Test3');
				yourself);
			yourself.
		
		GtkWindow new
			defaultSize: 400@400;
			title: 'Source view example';
			child: (GtkPopoverMenuBar new
				menuModel: menuModel;
				yourself);
			present ]
]

{ #category : #private }
GtkPopoverMenuBar class >> gtkNew [

	^ self ffiCall: #(GtkPopoverMenuBar* gtk_popover_menu_bar_new_from_model ("GMenuModel* model"NULL))

]

{ #category : #'instance creation' }
GtkPopoverMenuBar class >> new [

	^ self gtkNew initialize
]

{ #category : #accessing }
GtkPopoverMenuBar >> addChild: child id: id [

	self keepWidget: child.
	self basicAddChild: child id: id
]

{ #category : #private }
GtkPopoverMenuBar >> basicAddChild: child id: id [

	self ffiCall: #(gboolean gtk_popover_menu_bar_add_child (
  		self,
  		GtkWidget* child,
  		const char* id))

]

{ #category : #private }
GtkPopoverMenuBar >> basicRemove: child [

	^ self ffiCall: #(gboolean gtk_popover_menu_bar_remove_child (self, GtkWidget* child))
]

{ #category : #private }
GtkPopoverMenuBar >> getMenuModel [

	^ self ffiCall: #(GMenuModel* gtk_popover_menu_bar_get_menu_model (self))
]

{ #category : #accessing }
GtkPopoverMenuBar >> menuModel [

	^ menuModel ifNil: [ menuModel := self getMenuModel ]
]

{ #category : #accessing }
GtkPopoverMenuBar >> menuModel: aModel [

	menuModel := aModel.
	self setMenuModel: aModel.
	menuModel doNotAutoRelease
]

{ #category : #private }
GtkPopoverMenuBar >> setMenuModel: model [
	
	self ffiCall: #(void gtk_popover_menu_bar_set_menu_model (self, GMenuModel* model))
]
