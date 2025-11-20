"
https://docs.gtk.org/gtk3/enum.CellRendererMode.html
"
Class {
	#name : 'GtkCellRendererMode',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_CELL_RENDERER_MODE_ACTIVATABLE',
		'GTK_CELL_RENDERER_MODE_EDITABLE',
		'GTK_CELL_RENDERER_MODE_INERT'
	],
	#category : 'Gtk-Widget-CellRenderers',
	#package : 'Gtk',
	#tag : 'Widget-CellRenderers'
}

{ #category : 'accessing enum' }
GtkCellRendererMode class >> GTK_CELL_RENDERER_MODE_ACTIVATABLE [
	"This method was automatically generated"
	^ GTK_CELL_RENDERER_MODE_ACTIVATABLE
]

{ #category : 'accessing enum' }
GtkCellRendererMode class >> GTK_CELL_RENDERER_MODE_EDITABLE [
	"This method was automatically generated"
	^ GTK_CELL_RENDERER_MODE_EDITABLE
]

{ #category : 'accessing enum' }
GtkCellRendererMode class >> GTK_CELL_RENDERER_MODE_INERT [
	"This method was automatically generated"
	^ GTK_CELL_RENDERER_MODE_INERT
]

{ #category : 'enum declaration' }
GtkCellRendererMode class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors.
	"

	^ #(
  GTK_CELL_RENDERER_MODE_INERT 				0
  GTK_CELL_RENDERER_MODE_ACTIVATABLE 		1
  GTK_CELL_RENDERER_MODE_EDITABLE				2
	)
]
