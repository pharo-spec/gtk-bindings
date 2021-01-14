Extension { #name : #Color }

{ #category : #'*Gtk' }
Color >> asGdkRGBA [

	^ GdkRGBA 
		r: self red 
		g: self green 
		b: self blue 
		alpha: self alpha
]
