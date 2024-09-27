Extension { #name : 'DamageRecorder' }

{ #category : '*Gtk-Morphic' }
DamageRecorder >> hasInvalidRects [

	^ invalidRects notEmpty
]

{ #category : '*Gtk-Morphic' }
DamageRecorder >> invalidRects [

	^ invalidRects copy
]
