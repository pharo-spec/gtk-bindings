Extension { #name : #AthensCairoCanvas }

{ #category : #'*Gtk-Pango' }
AthensCairoCanvas >> showLayout: layout [
	self 
		ffiCall: #(void pango_cairo_show_layout (self, PangoLayout *layout))
		module: PangoCairoLibrary
]

{ #category : #'*Gtk-Pango' }
AthensCairoCanvas >> updateLayout: layout [
	self 
		ffiCall: #(void pango_cairo_update_layout (self, PangoLayout *layout))
		module: PangoCairoLibrary
]
