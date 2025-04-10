"
GtkCellRendererPixbuf — Renders a pixbuf in a cell

https://developer.gnome.org/gtk3/unstable/GtkCellRendererPixbuf.html
"
Class {
	#name : 'GtkCellRendererPixbuf',
	#superclass : 'GtkCellRenderer',
	#category : 'Gtk-Widget-CellRenderers',
	#package : 'Gtk',
	#tag : 'Widget-CellRenderers'
}

{ #category : 'private' }
GtkCellRendererPixbuf class >> cellRendererNew [

	^ self ffiCall: #(GtkCellRendererPixbuf *gtk_cell_renderer_pixbuf_new (void))
]

{ #category : 'accessing' }
GtkCellRendererPixbuf class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_cell_renderer_pixbuf_get_type())
]
