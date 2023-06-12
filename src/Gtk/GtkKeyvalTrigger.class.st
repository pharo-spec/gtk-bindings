"
https://docs.gtk.org/gtk4/class.KeyvalTrigger.html
"
Class {
	#name : #GtkKeyvalTrigger,
	#superclass : #GtkShortcutTrigger,
	#category : #'Gtk-Shortcut'
}

{ #category : #private }
GtkKeyvalTrigger class >> gtkNewKeyval: keyval modifiers: modifiers [

	^ self ffiCall: #(GtkKeyvalTrigger *gtk_keyval_trigger_new (guint keyval, GdkModifierType modifiers))
]

{ #category : #'instance creation' }
GtkKeyvalTrigger class >> newKeyCombination: aKeyCombination [
	| charValue modifiers |

	charValue := aKeyCombination platformCharacter asciiValue.
	modifiers := aKeyCombination platformModifier asGdkModifierType.
	^ self
		newKeyval: charValue 
		modifiers: modifiers
]

{ #category : #'instance creation' }
GtkKeyvalTrigger class >> newKeyval: keyval modifiers: modifiers [

	^ (self gtkNewKeyval: keyval modifiers: modifiers) initialize
]
