"
An example of a list with a popover menu.
"
Class {
	#name : #GtkPopoverMenuExample,
	#superclass : #Object,
	#category : #'Gtk4-Tests-Example'
}

{ #category : #'instance creation' }
GtkPopoverMenuExample class >> open [
	<script>

	^ self new open
]

{ #category : #private }
GtkPopoverMenuExample >> addContentsTo: window [
	| listView popoverMenu scrolledWindow widget actionGroup model item |

	widget := GtkBox newVertical.
	widget expand: true.

	listView := self newListView.
	scrolledWindow := GtkScrolledWindow newWidget: listView.
	scrolledWindow expand: true.
	widget append: scrolledWindow.

	popoverMenu := GtkPopoverMenu new.
	popoverMenu parent: widget.

	window child: widget.

	actionGroup := GSimpleActionGroup new.
	actionGroup insert: ((GSimpleAction newName: 'test1')
		connectActivate: [ 'TEST1' crTrace ];
		yourself).
	widget insertActionGroup: 'action' actions: actionGroup.

	widget addController: (GtkGestureClick new 
		name: 'clicked';
		beButtonSecondary;
		connectPressed: [ :pos |
			model := GMenu new 
				appendLabel: 'Test 1' action: 'action.test1';
				appendLabel: 'Test 2' action: 'action.test2';
				appendItem: ((item := GMenuItem new) 
					label: 'Test 3';
					detailedAction: 'action.test3';
					accel: '&lt;Control&gt;g';
					yourself);
				yourself.
			popoverMenu
				menuModel: model;
				pointingTo: (pos extent: 1@1);
				popup ];
		yourself)
]

{ #category : #private }
GtkPopoverMenuExample >> newListView [
	| store factory selectionModel |

	store :=  GListDataStore new.
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

	selectionModel := GtkSingleSelection newModel: store.

	^ GtkListView 
		newFactory: factory
		selectionModel: selectionModel
]

{ #category : #opening }
GtkPopoverMenuExample >> open [
	| window |
	
	GEngine ensureRunning.
	GRunLoop defer: [ 
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example list with context menu'.
		self addContentsTo: window.
		window present ]

	
]
