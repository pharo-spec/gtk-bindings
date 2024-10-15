Extension { #name : 'Point' }

{ #category : '*Gdk' }
Point >> asGraphenePoint [

	^ GraphenePoint new 
		x: self x;
		y: self y;
		yourself
]
