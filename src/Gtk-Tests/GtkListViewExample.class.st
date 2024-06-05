"
An example of a gtk4 list
"
Class {
	#name : 'GtkListViewExample',
	#superclass : 'Object',
	#category : 'Gtk-Tests-Examples',
	#package : 'Gtk-Tests',
	#tag : 'Examples'
}

{ #category : 'instance creation' }
GtkListViewExample class >> open [
	<script>

	^ self new open
]

{ #category : 'private' }
GtkListViewExample >> addContentsTo: window [
	| listView scrolledWindow box |

	box := GtkBox newVertical.
	box expand: true.

	listView := self newListView.
	scrolledWindow := GtkScrolledWindow newWidget: listView.
	scrolledWindow expand: true.
	box append: scrolledWindow.

	window child: box
]

{ #category : 'as yet unclassified' }
GtkListViewExample >> newListView [
	| store factory selectionModel |

	store :=  GListReferenceStore new.
	store items: Smalltalk allClassesAndTraits.
	 
	factory := GtkSignalListItemFactory new.
	factory connectSetup: [ :listItem |
		listItem child: (factory storeObject: (GtkBox newHorizontal
			spacing: 10;
			append: GtkImage new;
			append: GtkLabel new;
			yourself)) ].
	factory connectBind: [ :listItem |
		| box item |
		box := factory objectAtHandle: listItem child.
		item := store items at: listItem position + 1.
		box children first 
			pixbuf: (UITheme current iconNamed: item systemIconName) asGdkPixbuf.
		box children second 
			label: item name ].

	selectionModel := GtkSingleSelection new.
	"selectionModel canUnselect: true."
	selectionModel autoSelect: false.
	selectionModel model: store.

	^ GtkListView new
		factory: factory;
		selectionModel: selectionModel;
		yourself
]

{ #category : 'opening' }
GtkListViewExample >> open [
	<script: 'self new open'>
	| window |

	GEngine ensureRunning.
	GRunLoop defer: [ 
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: self title.
		self addContentsTo: window.
		window present ]
]

{ #category : 'opening' }
GtkListViewExample >> title [
	
	^ 'Example list'
]
