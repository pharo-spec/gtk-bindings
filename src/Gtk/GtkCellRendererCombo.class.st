"
GtkCellRendererCombo — Renders a combobox in a cell

https://developer-old.gnome.org/gtk3/unstable/GtkCellRendererCombo.html#gtk-cell-renderer-combo-new
"
Class {
	#name : #GtkCellRendererCombo,
	#superclass : #GtkCellRendererText,
	#category : #'Gtk-Widget-CellRenderers'
}

{ #category : #private }
GtkCellRendererCombo class >> cellRendererNew [

	^ self ffiCall: #(GtkCellRendererCombo *gtk_cell_renderer_combo_new (void))
]

{ #category : #accessing }
GtkCellRendererCombo class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_cell_renderer_combo_get_type())
]
