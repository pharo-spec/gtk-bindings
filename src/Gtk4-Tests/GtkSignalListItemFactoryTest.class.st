Class {
	#name : #GtkSignalListItemFactoryTest,
	#superclass : #GtkBaseWithWindowTest,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
GtkSignalListItemFactoryTest >> testConnectSetup [
	| widget executed |

	executed := false.
	self defer: [ 
		widget := GtkListView newFactory: (GtkSignalListItemFactory new
			connectSetup: [ :listItem | executed := true ];
			yourself).
		self window child: widget ].
	100 milliSeconds wait.
	self assert: executed
]
