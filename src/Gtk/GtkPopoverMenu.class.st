"
GtkPopoverMenu — Popovers to use as menus

https://developer.gnome.org/gtk3/stable/GtkPopoverMenu.html
"
Class {
	#name : #GtkPopoverMenu,
	#superclass : #GtkPopover,
	#instVars : [
		'menuModel',
		'children'
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

{ #category : #private }
GtkPopoverMenu class >> gtkNewFromModelFull: model flags: flags [

	^ self ffiCall: #(GtkPopoverMenu *gtk_popover_menu_new_from_model_full (GMenuModel* model, guint flags))
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

{ #category : #'instance creation' }
GtkPopoverMenu class >> newFromModelFull: aModel [

	^ (self gtkNewFromModelFull: aModel flags: 1) 
		initializeModel: aModel;
		yourself
]

{ #category : #accessing }
GtkPopoverMenu >> addChild: aWidget id: id [

	"just keep it if we actually added it"
	(self basicAddChild: aWidget id: id)
		ifTrue: [ self keepWidget: aWidget ]
	
]

{ #category : #initialization }
GtkPopoverMenu >> autoObjectUnref [

	"self autoRelease"
]

{ #category : #private }
GtkPopoverMenu >> basicAddChild: aWidget id: id [

	^ self ffiCall: #(gboolean gtk_popover_menu_add_child (
	self,
	GtkWidget* aWidget,
	const char* id))
]

{ #category : #private }
GtkPopoverMenu >> basicRemoveChild: aWidget [

	self ffiCall: #(gboolean gtk_popover_menu_remove_child (
		self,
		GtkWidget* aWidget))
]

{ #category : #finalization }
GtkPopoverMenu >> finalize [

	self isValidHandle ifFalse: [ ^ self ].
	self unparent.
	super finalize
]

{ #category : #private }
GtkPopoverMenu >> getMenuModel [

	^ self ffiCall: #(GMenuModel* gtk_popover_menu_get_menu_model (self))
]

{ #category : #initialization }
GtkPopoverMenu >> initialize [

	super initialize.
	"self objectRef"
]

{ #category : #initialization }
GtkPopoverMenu >> initializeModel: aModel [

	self initialize.	
	menuModel := aModel.
	menuModel doNotAutoRelease
]

{ #category : #private }
GtkPopoverMenu >> keepWidget: widget [

	children ifNil: [ children := #() ].
	children := children copyWith: widget
]

{ #category : #accessing }
GtkPopoverMenu >> menuModel [

	^ menuModel ifNil: [ menuModel := self getMenuModel ]
]

{ #category : #accessing }
GtkPopoverMenu >> menuModel: aModel [

	menuModel := aModel.
	self setMenuModel: menuModel.
	menuModel doNotAutoRelease
]

{ #category : #accessing }
GtkPopoverMenu >> removeChild: aWidget [

	children := children copyWithout: aWidget.
	self basicRemoveChild: aWidget
]

{ #category : #private }
GtkPopoverMenu >> setMenuModel: model [

	self ffiCall: #(void gtk_popover_menu_set_menu_model (self, GMenuModel* model))
]
