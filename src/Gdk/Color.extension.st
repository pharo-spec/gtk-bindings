Extension { #name : #Color }

{ #category : #'*Gdk' }
Color >> asGdkRGBA [

	^ GdkRGBA 
		r: self red 
		g: self green 
		b: self blue 
		alpha: self alpha
]
