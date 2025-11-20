Extension { #name : 'AthensCairoSurface' }

{ #category : '*Gtk' }
AthensCairoSurface >> asGdkTexture [
	| bytes |
	logger trace.
	bytes := GBytes newData: self getDataPtr size: self privateHeight * self stride.
	^ [ GdkMemoryTexture 
			newWidth: self width 
			height: self privateHeight
			format: GdkMemoryFormat GDK_MEMORY_DEFAULT
			bytes: bytes
			stride: self stride ]
		ensure: [ 
			bytes unref ]
]

{ #category : '*Gtk' }
AthensCairoSurface >> directDrawDuring: aBlock [
	"You may draw on receiver only when inside a block and only using provided canvas object.
	This ensures releasing system resources used after finishing drawing"

	currentCanvas ifNotNil: [ self attemptToRecurseDrawing ].
	[
		currentCanvas := context.
		aBlock cull: currentCanvas.
		self flush.
	] ensure: [
		currentCanvas := nil ].
]

{ #category : '*Gtk' }
AthensCairoSurface >> fromCanvas: aCanvas [

	session := Smalltalk session.
	"id := self class registerSurface: self."
	context := aCanvas.
	builder := AthensCairoPathBuilder new.
	builder context: context.
	ftFontRenderer := CairoFreetypeFontRenderer new 
		canvas: context;
		yourself
]

{ #category : '*Gtk' }
AthensCairoSurface >> getHandle [

	^ handle
]
