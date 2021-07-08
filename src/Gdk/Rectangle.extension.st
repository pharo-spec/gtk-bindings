Extension { #name : #Rectangle }

{ #category : #'*Gdk' }
Rectangle >> asGdkRectangle [

	^ GdkRectangle new 
		x: self left asInteger;
		y: self top asInteger;
		width: self width asInteger;
		height: self height asInteger
]
