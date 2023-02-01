"
An example of a dropdown.
"
Class {
	#name : #GtkDropDownExample,
	#superclass : #Object,
	#category : #'Gtk4-Tests-Example'
}

{ #category : #'instance creation' }
GtkDropDownExample class >> open [
	<script>

	^ self new open
]

{ #category : #private }
GtkDropDownExample >> addContentsTo: window [
	| dropDown widget |

	widget := GtkBox newVertical.
	widget expand: true.

	dropDown := self newDropDown.
	widget append: dropDown.

	window child: widget
]

{ #category : #private }
GtkDropDownExample >> newDropDown [
	| store factory model |

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
		item := store itemAt: listItem position + 1.
		box children first
			pixbuf: (UITheme current iconNamed: item systemIconName) asGdkPixbuf.
		box children second
			label: item name ].

	model := GtkSingleSelection newModel: store.

	^ GtkDropDown new
		listFactory: factory;
		model: model;
		expression: (GtkCClosureExpression newStringCallback: [ :handle |
			(store itemAtHandle: handle) ifNotNil: #name ]);
		yourself
]

{ #category : #opening }
GtkDropDownExample >> open [
	| window |

	GEngine ensureRunning.
	GRunLoop defer: [
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example dropdown'.
		self addContentsTo: window.
		window present ]
]
