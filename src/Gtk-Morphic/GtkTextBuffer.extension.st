Extension { #name : 'GtkTextBuffer' }

{ #category : '*Gtk-Morphic' }
GtkTextBuffer >> asText [
	| text pos iter atEnd |
	
	text := self text asText.
	iter := self startIter.
	pos := 1.
	atEnd := false.
	[ atEnd ] whileFalse: [ 
		iter tags do: [ :eachTag |
			eachTag asTextAttributeList do: [ :eachAttr | 
				text addAttribute: eachAttr from: pos to: pos ] ].
		pos := pos + 1.
		atEnd := iter forwardChar not ].

	^ text
]
