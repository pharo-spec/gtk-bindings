Extension { #name : #Rectangle }

{ #category : #'*Gtk' }
Rectangle >> asGdkRectangle [

	^ GdkRectangle new 
		x: self left;
		y: self top;
		width: self width;
		height: self height
]
