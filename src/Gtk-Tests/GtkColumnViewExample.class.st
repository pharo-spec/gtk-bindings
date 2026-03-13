"
An example of a gtk4 list
"
Class {
	#name : 'GtkColumnViewExample',
	#superclass : 'Object',
	#category : 'Gtk-Tests-Examples',
	#package : 'Gtk-Tests',
	#tag : 'Examples'
}

{ #category : 'instance creation' }
GtkColumnViewExample class >> open [
	<script>

	^ self new open
]

{ #category : 'private' }
GtkColumnViewExample >> addContentsTo: window [
	| columnView scrolledWindow box |

	box := GtkBox newVertical.
	box expand: true.

	columnView := self newColumnView.
	scrolledWindow := GtkScrolledWindow newWidget: columnView.
	scrolledWindow expand: true.
	box append: scrolledWindow.

	window child: box
]

{ #category : 'private' }
GtkColumnViewExample >> newColumn1: store [
	| factory |

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
		
	^ GtkColumnViewColumn new 
		title: 'Class';
		factory: factory;
		yourself
]

{ #category : 'private' }
GtkColumnViewExample >> newColumn2: store [
	| factory |

	factory := GtkSignalListItemFactory new.
	factory connectSetup: [ :listItem |
		listItem child: (factory storeObject: (GtkBox newHorizontal
			append: GtkLabel new;
			yourself)) ].
	factory connectBind: [ :listItem |
		| box item |
		box := factory objectAtHandle: listItem child.
		item := store items at: listItem position + 1.
		box children first 
			label: item linesOfCode asString ].
		
	^ GtkColumnViewColumn new 
		title: 'Lines of code';
		factory: factory;
		yourself
]

{ #category : 'private' }
GtkColumnViewExample >> newColumnView [
	| store selectionModel columnView |

	store :=  GListReferenceStore new.
	store items: Smalltalk allClassesAndTraits.
	 
	selectionModel := GtkSingleSelection new.
	"selectionModel canUnselect: true."
	selectionModel autoSelect: false.
	selectionModel model: store.

	columnView := GtkColumnView new.
	columnView appendColumn: (self newColumn1: store).
	columnView appendColumn: (self newColumn2: store).
	columnView selectionModel: selectionModel.
	
	^ columnView
]

{ #category : 'opening' }
GtkColumnViewExample >> open [
	<script: 'self new open'>
	| window |

	GEngine ensureRunning.
	GRunLoop defer: [ 
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example column view'.
		self addContentsTo: window.
		window present ]
]
