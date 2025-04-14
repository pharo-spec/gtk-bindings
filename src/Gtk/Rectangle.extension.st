Extension { #name : 'Rectangle' }

{ #category : '*Gtk' }
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
