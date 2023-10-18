"
GtkStackSwitcher
GtkStackSwitcher — A controller for GtkStack

https://developer.gnome.org/gtk3/stable/GtkStackSwitcher.html
"
Class {
	#name : 'GtkStackSwitcher',
	#superclass : 'GtkWidget',
	#classTraits : 'GtkTBin classTrait',
	#instVars : [
		'stack'
	],
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'instance creation' }
GtkStackSwitcher class >> forStack: aStack [

	^ self new stack: aStack; yourself
]

{ #category : 'accessing' }
GtkStackSwitcher class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_stack_switcher_get_type())
]

{ #category : 'instance creation' }
GtkStackSwitcher class >> gtkNewStackSwitcher [

	^ self ffiCall: #(GtkStackSwitcher * gtk_stack_switcher_new (void))
]

{ #category : 'instance creation' }
GtkStackSwitcher class >> new [

	^ self gtkNewStackSwitcher initialize
]

{ #category : 'private' }
GtkStackSwitcher >> getStack [

	^ self ffiCall: #(GtkStack gtk_stack_switcher_get_stack (self))
]

{ #category : 'private' }
GtkStackSwitcher >> setStack: aStack [

	self ffiCall: #(void gtk_stack_switcher_set_stack (self, GtkStack *aStack))
]

{ #category : 'accessing' }
GtkStackSwitcher >> stack [

	^ stack ifNil: [ stack := self getStack ]
]

{ #category : 'accessing' }
GtkStackSwitcher >> stack: aStack [

	stack := aStack.
	self setStack: aStack
	
]
