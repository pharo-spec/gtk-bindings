Class {
	#name : 'GtkPopoverMenuBarExample',
	#superclass : 'Object',
	#category : 'Gtk-Tests-Examples',
	#package : 'Gtk-Tests',
	#tag : 'Examples'
}

{ #category : 'instance creation' }
GtkPopoverMenuBarExample class >> open [
	<script>

	^ self new open
]

{ #category : 'private' }
GtkPopoverMenuBarExample >> addContentsTo: window [
	"installing shortcuts is complicated in gtk4 :)
	 1. you need an action (see testAction).
	 2. you need to install the action (as an action group, see actionGroup)
	 3. you need to install the shortcut (see addGlobalShortcut:)
	 4. finally, you need to install the actionGroup. 
	 To make the actions enabled (by default, you can always disable them by code) 
	 AND THE SHORTCUTS VISIBLE, shortcuts need to be installed in the same widget subtree 
	 as the action (but not necesarily in the same widget, e.g. a GtkBox can have the aciton 
	 and an inner listView can have the shortcut). 
	  "
	| listView menuBar scrolledWindow box actionGroup model testAction |

	box := GtkBox newVertical.
	box expand: true.

	menuBar := GtkPopoverMenuBar new.

	testAction := (GSimpleAction newName: 'test1')
		connectActivate: [ 'TEST1' crTrace ];
		yourself.

	"apparently, adding a global shortcut to the window (GtkWindow) object 
	 creates a problem and a crash, hence, I need to install them into an 
	 inner element always :("
	box addGlobalShortcut: (GtkShortcut 
		newKeyCombination: $x ctrl 
		actionName: 'action.test1').
		
	model := GMenu new
		appendLabel: 'Menu' submenu: (GMenu new 
			appendLabel: 'Test 1' actionName: 'action.test1';
			appendLabel: 'Test 2' actionName: 'action.test2';
			yourself);
		yourself.
		
	menuBar menuModel: model.
	menuBar expand: false.
	box append: menuBar.

	listView := self newListView.
	scrolledWindow := GtkScrolledWindow newWidget: listView.
	scrolledWindow expand: true.
	box append: scrolledWindow.

	actionGroup := GSimpleActionGroup new.
	actionGroup insert: testAction.
	box insertActionGroup: 'action' actions: actionGroup.
	
	window child: box
]

{ #category : 'private' }
GtkPopoverMenuBarExample >> newListView [
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
GtkPopoverMenuBarExample >> open [
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
