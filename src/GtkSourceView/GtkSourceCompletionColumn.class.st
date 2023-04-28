"
https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/enum.CompletionColumn.html
"
Class {
	#name : #GtkSourceCompletionColumn,
	#superclass : #GEnumeration,
	#classVars : [
		'GTK_SOURCE_COMPLETION_COLUMN_AFTER',
		'GTK_SOURCE_COMPLETION_COLUMN_BEFORE',
		'GTK_SOURCE_COMPLETION_COLUMN_COMMENT',
		'GTK_SOURCE_COMPLETION_COLUMN_DETAILS',
		'GTK_SOURCE_COMPLETION_COLUMN_ICON',
		'GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT'
	],
	#category : #'GtkSourceView-Completion'
}

{ #category : #'accessing enum' }
GtkSourceCompletionColumn class >> GTK_SOURCE_COMPLETION_COLUMN_AFTER [
	"This method was automatically generated"
	^ GTK_SOURCE_COMPLETION_COLUMN_AFTER
]

{ #category : #'accessing enum' }
GtkSourceCompletionColumn class >> GTK_SOURCE_COMPLETION_COLUMN_BEFORE [
	"This method was automatically generated"
	^ GTK_SOURCE_COMPLETION_COLUMN_BEFORE
]

{ #category : #'accessing enum' }
GtkSourceCompletionColumn class >> GTK_SOURCE_COMPLETION_COLUMN_COMMENT [
	"This method was automatically generated"
	^ GTK_SOURCE_COMPLETION_COLUMN_COMMENT
]

{ #category : #'accessing enum' }
GtkSourceCompletionColumn class >> GTK_SOURCE_COMPLETION_COLUMN_DETAILS [
	"This method was automatically generated"
	^ GTK_SOURCE_COMPLETION_COLUMN_DETAILS
]

{ #category : #'accessing enum' }
GtkSourceCompletionColumn class >> GTK_SOURCE_COMPLETION_COLUMN_ICON [
	"This method was automatically generated"
	^ GTK_SOURCE_COMPLETION_COLUMN_ICON
]

{ #category : #'accessing enum' }
GtkSourceCompletionColumn class >> GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT [
	"This method was automatically generated"
	^ GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT
]

{ #category : #'enum declaration' }
GtkSourceCompletionColumn class >> enumDecl [
	"self initializeEnumeration.
	 self rebuildEnumAccessors"

	^ #(
	GTK_SOURCE_COMPLETION_COLUMN_ICON 		0
	GTK_SOURCE_COMPLETION_COLUMN_BEFORE 		1
	GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT 2
	GTK_SOURCE_COMPLETION_COLUMN_AFTER 		3
	GTK_SOURCE_COMPLETION_COLUMN_COMMENT 	4
	GTK_SOURCE_COMPLETION_COLUMN_DETAILS	 	5
	)
]
