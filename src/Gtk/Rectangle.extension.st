Extension { #name : #Rectangle }

{ #category : #'*Gtk' }
Rectangle >> asGdkRectangle [

	^ GdkRectangle new 
		x: self left asInteger;
		y: self top asInteger;
		width: self width asInteger;
		height: self height asInteger
]

{ #category : #'*Gtk' }
Rectangle >> asGtkAllocation [
	| extent |

	extent := self extent.
	^ GtkAllocation new 
		x: self origin x asInteger;
		y: self origin y asInteger;
		width: extent x asInteger;
		height: extent y asInteger;
		yourself
]
