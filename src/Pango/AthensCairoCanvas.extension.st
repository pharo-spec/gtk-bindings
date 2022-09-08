Extension { #name : #AthensCairoCanvas }

{ #category : #'*Pango' }
AthensCairoCanvas >> showGlyphItem: glyphItem text: text [

	self 
		ffiCall: #(void pango_cairo_show_glyph_item (
			self,
			const char       *text,
			PangoGlyphItem   *glyphItem))
		module: PangoCairoLibrary

]

{ #category : #'*Pango' }
AthensCairoCanvas >> showGlyphString: glyphs font: font [

	self 
		ffiCall: #(void pango_cairo_show_glyph_string (
			self, 
			PangoFont        *font,
			PangoGlyphString *glyphs))
		module: PangoCairoLibrary

]

{ #category : #'*Pango' }
AthensCairoCanvas >> showLayout: layout [
	self 
		ffiCall: #(void pango_cairo_show_layout (self, PangoLayout *layout))
		module: PangoCairoLibrary
]

{ #category : #'*Pango' }
AthensCairoCanvas >> updateLayout: layout [
	self 
		ffiCall: #(void pango_cairo_update_layout (self, PangoLayout *layout))
		module: PangoCairoLibrary
]
