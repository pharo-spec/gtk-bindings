"
GtkStackSidebar
GtkStackSidebar — An automatic sidebar widget

https://docs.gtk.org/gtk4/class.StackSidebar.html
"
Class {
	#name : 'GtkStackSidebar',
	#superclass : 'GtkWidget',
	#instVars : [
		'stack'
	],
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'instance creation' }
GtkStackSidebar class >> forStack: aStack [

	^ self new stack: aStack; yourself
]

{ #category : 'accessing' }
GtkStackSidebar class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_stack_sidebar_get_type())
]

{ #category : 'private' }
GtkStackSidebar class >> gtkNewStackSidebar [

	^ self ffiCall: #(GtkStackSidebar *gtk_stack_sidebar_new (void))
]

{ #category : 'instance creation' }
GtkStackSidebar class >> new [

	^ self gtkNewStackSidebar initialize
]

{ #category : 'private' }
GtkStackSidebar >> getStack [

	^ self ffiCall: #(GtkStack *gtk_stack_sidebar_get_stack (self))
]

{ #category : 'private' }
GtkStackSidebar >> setStack: aStack [

	self ffiCall: #(void gtk_stack_sidebar_set_stack (self, GtkStack *aStack))
]

{ #category : 'accessing' }
GtkStackSidebar >> stack [

	^ stack ifNil: [ stack := self getStack ]
]

{ #category : 'accessing' }
GtkStackSidebar >> stack: aStack [

	stack := aStack.
	self setStack: aStack
]
