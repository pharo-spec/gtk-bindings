"
! GtkTreeDataPixbufColumn

A data column that provides a pixbuf (see *class:GdkPixbuf*).
"
Class {
	#name : 'GtkTreeDataPixbufColumn',
	#superclass : 'GtkTreeDataColumn',
	#category : 'Gtk-Widget-Tree-Store',
	#package : 'Gtk',
	#tag : 'Widget-Tree-Store'
}

{ #category : 'accessing' }
GtkTreeDataPixbufColumn >> gType [

	^ GType G_TYPE_OBJECT
]

{ #category : 'accessing' }
GtkTreeDataPixbufColumn >> setValueOf: item path: path to: gValue [
	| image |

	image := self readObject: item.
	image ifNil: [ ^ self ].
	gValue setObject: (self store
		imageAt: image 
		ifAbsentPut: [ image asGdkPixbuf ])
		getHandle
]
