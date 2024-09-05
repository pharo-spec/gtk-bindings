"
An example of a list with a popover menu.
"
Class {
	#name : 'GtkPopoverMenuExample',
	#superclass : 'Object',
	#category : 'Gtk-Tests-Examples',
	#package : 'Gtk-Tests',
	#tag : 'Examples'
}

{ #category : 'instance creation' }
GtkPopoverMenuExample class >> open [
	<script>

	^ self new open
]

{ #category : 'private' }
GtkPopoverMenuExample >> addContentsTo: window [
	| listView popoverMenu scrolledWindow box actionGroup model testAction |

	box := GtkBox newVertical.
	box expand: true.

	listView := self newListView.
	scrolledWindow := GtkScrolledWindow newWidget: listView.
	scrolledWindow expand: true.
	box append: scrolledWindow.

	testAction := (GSimpleAction newName: 'test1')
		connectActivate: [ listView selectionModel selected crTrace ];
		yourself.
		
	"apparently, adding a global shortcut to the window (GtkWindow) object 
	 creates a problem and a crash, hence, I need to install them into an 
	 inner element always :("
	box addGlobalShortcut: (GtkShortcut 
		newKeyCombination: $p ctrl
		actionName: 'action.test1').

	model := GMenu new 
		appendLabel: 'Test 1' actionName: 'action.test1';
		appendLabel: 'Test 2' actionName: 'action.test2';
		yourself.

	popoverMenu := GtkPopoverMenu new.
	popoverMenu parent: listView.
	popoverMenu menuModel: model.

	window child: box.

	actionGroup := GSimpleActionGroup new.
	actionGroup insert: testAction.
	box insertActionGroup: 'action' actions: actionGroup.

	listView addRightClickEvent: [ :event | 
		popoverMenu
			pointingTo: (event position extent: 1@1);
			popup ]
]

{ #category : 'private' }
GtkPopoverMenuExample >> newListView [
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

	selectionModel := GtkSingleSelection newModel: store.

	^ GtkListView new
		factory: factory;
		selectionModel: selectionModel;
		yourself
]

{ #category : 'opening' }
GtkPopoverMenuExample >> open [
	<script: 'self new open'>
	| window |

	GEngine ensureRunning.
	GRunLoop defer: [ 
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example list with context menu'.
		self addContentsTo: window.
		window present ]
]
