"
https://docs.gtk.org/gtk4/class.ColumnViewSorter.html
"
Class {
	#name : 'GtkColumnViewSorter',
	#superclass : 'GtkSorter',
	#instVars : [
		'columnView'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'accessing' }
GtkColumnViewSorter >> columnView [
	
	^ columnView
]

{ #category : 'accessing' }
GtkColumnViewSorter >> columnView: aColumnView [
	
	columnView := aColumnView
]

{ #category : 'private' }
GtkColumnViewSorter >> getPrimarySortColumn [

	^ self ffiCall: #(GtkColumnViewColumn* gtk_column_view_sorter_get_primary_sort_column (self))
]

{ #category : 'accessing' }
GtkColumnViewSorter >> primarySortColumn [
	
	^ self primarySortColumnIfNone: [ nil ]
]

{ #category : 'accessing' }
GtkColumnViewSorter >> primarySortColumnIfNone: aBlock [
	| ref |
	
	ref := self getPrimarySortColumn.
	^ self columnView columns
		detect: [ :each | each getHandle = ref getHandle ]
		ifNone: aBlock
]

{ #category : 'accessing' }
GtkColumnViewSorter >> primarySortColumnIndex [
	| column |

	column := self primarySortColumnIfNone: [ ^ 0 ].
	^ self columnView columns indexOf: column
]

{ #category : 'accessing' }
GtkColumnViewSorter >> primarySortOrder [

	^ self ffiCall: #("GtkSortType"int gtk_column_view_sorter_get_primary_sort_order (self))
]
