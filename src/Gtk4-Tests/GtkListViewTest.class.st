Class {
	#name : #GtkListViewTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk4-Tests'
}

{ #category : #running }
GtkListViewTest >> tearDown [
	
	super tearDown
]

{ #category : #tests }
GtkListViewTest >> testFactory [
	| factory |

	self defer: [ 
		self widget factory: ((factory := GtkSignalListItemFactory new)  
			connectSetup: [ :listItem | ];
			connectBind: [ :listItem | ];
			yourself) ].
		
	self 
		assert: (self defer: [ self widget factory ]) getHandle 
		equals: factory getHandle
]

{ #category : #tests }
GtkListViewTest >> testNew [

	widget := self defer: [ self widgetClass new ].
	self deny: widget getHandle isNull
]

{ #category : #tests }
GtkListViewTest >> testNewFactory [

	widget := self defer: [ 
		self widgetClass newFactory: (GtkSignalListItemFactory new 
			connectSetup: [ :listItem | ];
			connectBind: [ :listItem | ];
			yourself) ].
	self deny: widget getHandle isNull
]

{ #category : #accessing }
GtkListViewTest >> widgetClass [

	^ GtkListView
]
