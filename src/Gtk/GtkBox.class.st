"
GtkBox — A container box.

https://developer.gnome.org/gtk3/stable/GtkBox.html
"
Class {
	#name : #GtkBox,
	#superclass : #GtkContainer,
	#pools : [
		'GtkOrientation'
	],
	#category : #'Gtk-Widget-Container'
}

{ #category : #private }
GtkBox class >> boxNewOrientation: orientation spacing: spacing [

	^ self ffiCall: #(GtkBox *gtk_box_new (GtkOrientation orientation, gint spacing))
]

{ #category : #accessing }
GtkBox class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_box_get_type())
]

{ #category : #'instance creation' }
GtkBox class >> new [ 
	self error: 'Use one of my siblings'
]

{ #category : #'instance creation' }
GtkBox class >> newHorizontal [
	^ self newHorizontalSpacing: 0
]

{ #category : #'instance creation' }
GtkBox class >> newHorizontalSpacing: spacing [
	^ (self boxNewOrientation: GTK_ORIENTATION_HORIZONTAL spacing: spacing) initialize
]

{ #category : #'instance creation' }
GtkBox class >> newVertical [
	^ self newVerticalSpacing: 0
]

{ #category : #'instance creation' }
GtkBox class >> newVerticalSpacing: spacing [
	^ (self boxNewOrientation: GTK_ORIENTATION_VERTICAL spacing: spacing) initialize
]

{ #category : #accessing }
GtkBox >> add: child [
	"Add is not a valid message for boxes (they use pack* family)"
	
	^ self append: child
]

{ #category : #accessing }
GtkBox >> append: child [

	self keepWidget: child.
	self basicAppend: child
]

{ #category : #private }
GtkBox >> basicAppend: child [ 

	^ self ffiCall: #(void gtk_box_append (self, GtkWidget *child))
]

{ #category : #private }
GtkBox >> basicPrepend: child [ 

	^ self ffiCall: #(void gtk_box_prepend (self, GtkWidget *child))
]

{ #category : #private }
GtkBox >> basicRemove: child [

	self ffiCall: #(void gtk_box_remove (self, GtkWidget* child))
]

{ #category : #accessing }
GtkBox >> homogeneous: homogeneous [

	self ffiCall: #(void gtk_box_set_homogeneous (self, gboolean homogeneous)) 
]

{ #category : #testing }
GtkBox >> isHomogeneous [

	self ffiCall: #(gboolean gtk_box_get_homogeneous (self)) 
]

{ #category : #accessing }
GtkBox >> packEnd: child [

	self 
		deprecated: 'Use #prepend: (there are other forms to declare the other properties)' 
		transformWith: 
			   '`@receiver packEnd: `@child' 
			-> '`@receiver prepend: `@child'.

	^ self prepend: child
]

{ #category : #accessing }
GtkBox >> packEnd: child expand: aBoolean [

	self 
		deprecated: 'Use #prepend: (there are other forms to declare the other properties)' 
		transformWith: 
			   '`@receiver packEnd: `@child expand: `@expand' 
			-> '`@receiver prepend: `@child'.

	^ self prepend: child
]

{ #category : #accessing }
GtkBox >> packEnd: child expand: expand fill: fill padding: padding [

	self 
		deprecated: 'Use #prepend: (there are other forms to declare the other properties)' 
		transformWith: 
			   '`@receiver packEnd: `@child expand: `@expand fill: `@fill padding: `@padding' 
			-> '`@receiver prepend: `@child'.

	^ self prepend: child
]

{ #category : #accessing }
GtkBox >> packEnd: child padding: padding [

	self 
		deprecated: 'Use #prepend: (there are other forms to declare the other properties)' 
		transformWith: 
			   '`@receiver packEnd: `@child padding: `@padding' 
			-> '`@receiver prepend: `@child'.

	^ self prepend: child
]

{ #category : #accessing }
GtkBox >> packStart: child [

	self 
		deprecated: 'Use #append: (there are other forms to declare the other properties)' 
		transformWith: 
			   '`@receiver packStart: `@child' 
			-> '`@receiver append: `@child'.

	^ self append: child
]

{ #category : #accessing }
GtkBox >> packStart: child expand: expand [

	self 
		deprecated: 'Use #append: (there are other forms to declare the other properties)' 
		transformWith: 
			   '`@receiver packStart: `@child expand: `@expand' 
			-> '`@receiver append: `@child'.

	^ self append: child
]

{ #category : #accessing }
GtkBox >> packStart: child expand: expand fill: fill padding: padding [ 

	self 
		deprecated: 'Use #append: (there are other forms to declare the other properties)' 
		transformWith: 
			   '`@receiver packStart: `@child expand: `@expand fill: `@fill padding: `@padding' 
			-> '`@receiver append: `@child'.

	^ self append: child
]

{ #category : #accessing }
GtkBox >> packStart: child padding: padding [

	self 
		deprecated: 'Use #packStart: (padding need to be declared by styles)' 
		transformWith: 
			   '`@receiver packStart: `@child padding: `@padding' 
			-> '`@receiver append: `@child'.

	^ self append: child
]

{ #category : #accessing }
GtkBox >> prepend: child [

	self keepWidget: child.
	self basicPrepend: child
]

{ #category : #accessing }
GtkBox >> spacing [

	^ self ffiCall: #(gint gtk_box_get_spacing (self))
]

{ #category : #accessing }
GtkBox >> spacing: 	spacing [
	
	^ self ffiCall: #(void gtk_box_set_spacing (self, gint spacing))
]
