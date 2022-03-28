"
I'm a font description

https://developer.gnome.org/pango/stable/pango-Fonts.html#PangoFontDescription
"
Class {
	#name : #PangoFontDescription,
	#superclass : #PangoObject,
	#classVars : [
		'PANGO_SCALE'
	],
	#category : #'Pango-Base'
}

{ #category : #finalization }
PangoFontDescription class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self pango_font_description_free: handle
]

{ #category : #initialization }
PangoFontDescription class >> initialize [

	PANGO_SCALE := 1024
]

{ #category : #'instance creation' }
PangoFontDescription class >> newFromString: aString [

	^ (self pango_font_description_from_string: aString) initialize
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_free: desc [
	self ffiCall: #(void pango_font_description_free (void *desc))
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_from_string: str [
	^ self ffiCall: #(PangoFontDescription *pango_font_description_from_string (const char *str))
]

{ #category : #accessing }
PangoFontDescription >> familyName [
	
	^ self ffiCall: #(String pango_font_description_get_family (self))
]

{ #category : #accessing }
PangoFontDescription >> familyName: family [ 

	^ self ffiCall: #(void pango_font_description_set_family(self, String family))
]

{ #category : #accessing }
PangoFontDescription >> fontSize [

	^ self ffiCall: #(gint pango_font_description_get_size ( self ))
]

{ #category : #accessing }
PangoFontDescription >> fontSize: size [

	self setSize: size * PANGO_SCALE
]

{ #category : #private }
PangoFontDescription >> getSize [

	^ self ffiCall: #(gint pango_font_description_get_size ( self ))
]

{ #category : #private }
PangoFontDescription >> setSize: size [

	^ self ffiCall: #(void pango_font_description_set_size ( self, gint size ))
]

{ #category : #accessing }
PangoFontDescription >> toFileName [

	^ self ffiCall: #(char *pango_font_description_to_filename ( self ))
]

{ #category : #accessing }
PangoFontDescription >> toString [

	^ self ffiCall: #(char *pango_font_description_to_string ( self ))
]
