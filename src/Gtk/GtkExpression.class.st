"
GtkExpression provides a way to describe references to values.
An important aspect of expressions is that the value can be obtained from a source that is several steps away (so is like a block, but in gtk side).

https://docs.gtk.org/gtk4/class.Expression.html

"
Class {
	#name : 'GtkExpression',
	#superclass : 'GBaseObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'accessing - referencing' }
GtkExpression >> objectUnref [

	self ffiCall: #(void gtk_expression_unref (self))
]

{ #category : 'accessing - referencing' }
GtkExpression >> objectUnrefNow [

	self doNotAutoRelease.
	self objectUnref
]
