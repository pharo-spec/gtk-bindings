"
https://docs.gtk.org/gtk4/class.CallbackAction.html
"
Class {
	#name : #GtkCallbackAction,
	#superclass : #GtkShortcutAction,
	#instVars : [
		'callback'
	],
	#category : #'Gtk-Shortcut'
}

{ #category : #private }
GtkCallbackAction class >> gtkNewCallback: callback [

	^ self ffiCall: #(GtkCallbackAction gtk_callback_action_new (
  "GtkShortcutFunc"GCallback callback,
  	NULL,
  	NULL))
]

{ #category : #'instance creation' }
GtkCallbackAction class >> newAction: aBlock [

	^ self newCallback: (GCallback
		signature: #(gboolean (void *widget, void *args, void *user_data))
		block: [ :widget :args :user_data |  aBlock cull: args ])
]

{ #category : #'instance creation' }
GtkCallbackAction class >> newCallback: aCallback [

	^ (self gtkNewCallback: aCallback)
		initializeCallback: aCallback;
		yourself
]

{ #category : #initialization }
GtkCallbackAction >> initializeCallback: aCallback [

	callback := aCallback.
	self initialize
]
