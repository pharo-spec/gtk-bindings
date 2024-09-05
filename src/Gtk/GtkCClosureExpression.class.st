"
A variant of GtkClosureExpression using a C closure.

https://docs.gtk.org/gtk4/class.CClosureExpression.html
"
Class {
	#name : 'GtkCClosureExpression',
	#superclass : 'GtkExpression',
	#instVars : [
		'callback'
	],
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'private' }
GtkCClosureExpression class >> gtkNewType: value_type callback: callback_func [

	^ self ffiCall: #(GtkCClosureExpression *gtk_cclosure_expression_new (
  GType value_type,
  "GClosureMarshal marshal"NULL,
  guint "n_params" 0,
  "GtkExpression** params"NULL,
  GCallback callback_func,
  "gpointer user_data"NULL,
  "GClosureNotify user_destroy"NULL))
]

{ #category : 'instance creation' }
GtkCClosureExpression class >> newStringCallback: aBlock [
	| callback |

	callback := GCallback
		signature: #(char * (void *handle))
		block: aBlock.

	^ (self gtkNewType: G_TYPE_STRING callback: callback)
		initializeCallback: callback;
		yourself
]

{ #category : 'initialization' }
GtkCClosureExpression >> initializeCallback: aCallback [

	self initialize.
	callback := aCallback
]

{ #category : 'accessing' }
GtkCClosureExpression >> keyval [

	^ self ffiCall: #(guint gtk_keyval_trigger_get_keyval (self))
]

{ #category : 'accessing' }
GtkCClosureExpression >> modifiers [

	^ self ffiCall: #(GdkModifierType gtk_keyval_trigger_get_modifiers (self))
]
