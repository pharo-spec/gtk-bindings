"
GtkTextTagTable — Collection of tags that can be used together

https://developer.gnome.org/gtk3/stable/GtkTextTagTable.html
"
Class {
	#name : #GtkTextTagTable,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'tags'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Misc'
}

{ #category : #accessing }
GtkTextTagTable class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_text_tag_table_get_type())
]

{ #category : #'instance creation' }
GtkTextTagTable class >> new [ 

	^ self textTagTableNew initialize
]

{ #category : #private }
GtkTextTagTable class >> textTagTableNew [ 

	^ self ffiCall: #(GtkTextTagTable *gtk_text_tag_table_new (void))
]

{ #category : #adding }
GtkTextTagTable >> add: tag [

	tags add: tag.
	self basicAdd: tag
]

{ #category : #adding }
GtkTextTagTable >> addAll: aListOfTags [

	aListOfTags do: [ :each | self add: each ]
]

{ #category : #adding }
GtkTextTagTable >> basicAdd: tag [

	^ self ffiCall: #(gboolean gtk_text_tag_table_add (self, GtkTextTag *tag))
]

{ #category : #initialization }
GtkTextTagTable >> initialize [

	super initialize.
	tags := OrderedCollection new
]

{ #category : #accessing }
GtkTextTagTable >> size [

	^ self ffiCall: #(gint gtk_text_tag_table_get_size (self))
]
