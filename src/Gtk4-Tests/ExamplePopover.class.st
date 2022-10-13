Class {
	#name : #ExamplePopover,
	#superclass : #Object,
	#category : #'Gtk4-Tests-Example'
}

{ #category : #examples }
ExamplePopover class >> addContentsTo: window [
	| listView popoverMenu scrolledWindow widget actionGroup model |

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
				yourself.
			popoverMenu
				menuModel: model;
				pointingTo: (pos extent: 1@1);
				popup ];
		yourself)
]

{ #category : #examples }
ExamplePopover class >> example [
	| app sem window |
	
	GEngine ensureRunning.
	
	app := GtkApplication newId: 'org.pharo.TestGtk4'.
	sem := Semaphore new.
	app connectActivate: [ 
		window := (GtkApplicationWindow newApplication: app).
		window defaultSize: 600@400.
		window title: 'Example list with context menu'.
		self addContentsTo: window.
		window present.
		sem signal ]. 
	app run.
	sem wait.


	"GRunLoop defer: [ window close ]."
]

{ #category : #examples }
ExamplePopover class >> newListView [
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
