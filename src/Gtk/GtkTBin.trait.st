"
Add ""one child behavior"" to classes.

"
Trait {
	#name : #GtkTBin,
	#instVars : [
		'child'
	],
	#category : #'Gtk-Widget-Container'
}

{ #category : #'instance creation' }
GtkTBin classSide >> newWidget: aWidget [

	^ self new
		  child: aWidget;
		  yourself
]

{ #category : #private }
GtkTBin >> basicRemove [

	self setChild: GObject null
]

{ #category : #accessing }
GtkTBin >> child [

	^ child
]

{ #category : #accessing }
GtkTBin >> child: aWidget [

	child := aWidget.
	self setChild: aWidget
]

{ #category : #private }
GtkTBin >> cleanupAfterReplacing [

	child cleanupAfterReplacing.
	child := nil
]

{ #category : #testing }
GtkTBin >> isBin [

	^ true
]

{ #category : #accessing }
GtkTBin >> removeChild [

	self basicRemove.
	child := nil
]

{ #category : #private }
GtkTBin >> setChild: aWidget [

	self shouldBeImplemented
]
