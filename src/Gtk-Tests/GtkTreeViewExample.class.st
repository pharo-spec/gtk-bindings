Class {
	#name : 'GtkTreeViewExample',
	#superclass : 'GtkListViewExample',
	#category : 'Gtk-Tests-Examples',
	#package : 'Gtk-Tests',
	#tag : 'Examples'
}

{ #category : 'instance creation' }
GtkTreeViewExample >> newFactory: store [
	| factory |
	
	factory := GtkSignalListItemFactory new.
	factory connectSetup: [ :listItem |
		listItem child: (factory storeObject: (GtkTreeExpander newWidget: (GtkBox newHorizontal
			spacing: 10;
			append: GtkImage new;
			append: GtkLabel new;
			yourself))) ].
	factory connectBind: [ :listItem |
		| expander box itemStore itemReference item row |
		
		row := GtkTreeListRow fromHandleUnreferenced: listItem item getHandle.
		expander := factory objectAtHandle: listItem child.
		expander listRow: row.
		box := expander child.
		
		itemReference := row item.
		itemStore := store storeAt: (itemReference dataAt: 'store').
		item := itemStore itemAtHandle: itemReference getHandle.

		box children first 
			pixbuf: (UITheme current iconNamed: item systemIconName) asGdkPixbuf.
		box children second 
			label: item name ].
		
	^ factory
]

{ #category : 'as yet unclassified' }
GtkTreeViewExample >> newListView [
	| store factory selectionModel |

	store :=  GTreeListReferenceStore new.
	store items: { Object }.
	
	factory := self newFactory: store.

	selectionModel := GtkSingleSelection new.
	selectionModel autoSelect: false.
	selectionModel model: (GtkTreeListModel
		newRootModel: store
		children: [ :itemHandle |
			store 
				itemAtHandle: itemHandle 
				children: [ :aClass | aClass subclasses ] ]).

	^ GtkListView new
		factory: factory;
		selectionModel: selectionModel;
		yourself
]

{ #category : 'opening' }
GtkTreeViewExample >> title [
	
	^ 'Example tree'
]
