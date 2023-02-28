"
https://docs.gtk.org/gtk4/class.ShortcutController.html
"
Class {
	#name : #GtkShortcutController,
	#superclass : #GtkEventController,
	#traits : 'GTListModel',
	#classTraits : 'GTListModel classTrait',
	#instVars : [
		'shortcuts'
	],
	#category : #'Gtk4-Event-Controllers'
}

{ #category : #private }
GtkShortcutController class >> gtkNew [

	self ffiCall: #(GtkShortcutController* gtk_shortcut_controller_new (void))
]

{ #category : #accessing }
GtkShortcutController >> addShortcut: aShortcut [

	self shortcuts add: aShortcut.
	self basicAddShortcut: aShortcut
]

{ #category : #private }
GtkShortcutController >> basicAddShortcut: shortcut [

	self ffiCall: #(void gtk_shortcut_controller_add_shortcut (self, GtkShortcut* shortcut))
]

{ #category : #private }
GtkShortcutController >> basicRemoveShortcut: shortcut [

	self ffiCall: #(void gtk_shortcut_controller_remove_shortcut (self, GtkShortcut* shortcut))
]

{ #category : #testing }
GtkShortcutController >> isShortcutController [

	^ true
]

{ #category : #accessing }
GtkShortcutController >> mnemonicsModifiers [

	self ffiCall: #(GdkModifierType gtk_shortcut_controller_get_mnemonics_modifiers (self))
]

{ #category : #accessing }
GtkShortcutController >> mnemonicsModifiers: modifiers [

	self ffiCall: #(void gtk_shortcut_controller_set_mnemonics_modifiers (
		self,
  		GdkModifierType modifiers))
]

{ #category : #accessing }
GtkShortcutController >> removeShortcut: aShortcut [

	self shortcuts remove: aShortcut.
	self basicRemoveShortcut: aShortcut
]

{ #category : #accessing }
GtkShortcutController >> shortcuts [

	^ shortcuts ifNil: [ shortcuts := Set new ]
]
