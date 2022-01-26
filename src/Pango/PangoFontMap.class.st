"
https://developer.gnome.org/pango/stable/pango-Fonts.html#PangoFontMap
"
Class {
	#name : #PangoFontMap,
	#superclass : #PangoObject,
	#category : #'Pango-Base'
}

{ #category : #'instance creation' }
PangoFontMap class >> default [ 

	^ self getDefault initialize
]

{ #category : #'library path' }
PangoFontMap class >> ffiLibraryName [ 

	^ PangoCairoLibrary
]

{ #category : #private }
PangoFontMap class >> getDefault [

	^ self ffiCall: #(PangoFontMap *pango_cairo_font_map_get_default ())
]

{ #category : #'instance creation' }
PangoFontMap class >> newFreeType [

	^ (self newType: "CAIRO_FONT_TYPE_FT" 1) initialize
]

{ #category : #private }
PangoFontMap class >> newType: fonttype [

	^ self ffiCall: #(PangoFontMap *pango_cairo_font_map_new_for_font_type ("cairo_font_type_t"int fonttype))
]

{ #category : #accessing }
PangoFontMap >> config: fcconfig [

	self ffiCall: #(void pango_fc_font_map_set_config (self, FcConfig *fcconfig))
]

{ #category : #accessing }
PangoFontMap >> configChanged [

	self ffiCall: #(void pango_fc_font_map_config_changed (self))
]

{ #category : #accessing }
PangoFontMap >> listFamilies [
	| count familiesHandle countBuffer |	

	familiesHandle := ExternalAddress new.
	countBuffer := FFIInt32 newBuffer.
		
	self listFamilies: familiesHandle count: countBuffer.
	
	count := countBuffer signedLongAt: 1.
	count = 0 ifTrue: [ ^ nil ].
	
	^ Array streamContents: [ :stream |
		0 to: (count - 1) do: [ :index |
			stream nextPut: (PangoFontFamily fromHandle: (familiesHandle pointerAt: (index * FFIExternalType pointerSize) +  1)) ] ]
]

{ #category : #private }
PangoFontMap >> listFamilies: families count: n_families [
	
	self ffiCall: #(void pango_font_map_list_families (
  		PangoFontMap* self,
  		"PangoFontFamily***" void **families,
  		"int*" void *n_families))
]
