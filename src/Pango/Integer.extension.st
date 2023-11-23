Extension { #name : 'Integer' }

{ #category : '*Pango' }
Integer >> pangoScaled [

	^ self * 1024
]

{ #category : '*Pango' }
Integer >> pangoUnscaled [

	^ self / 1024.0
]
