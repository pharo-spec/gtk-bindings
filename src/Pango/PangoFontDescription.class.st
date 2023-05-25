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

{ #category : #initialization }
PangoFontDescription class >> initialize [

	PANGO_SCALE := 1024
]

{ #category : #'instance creation' }
PangoFontDescription class >> new [

	^ self pango_font_description_new initialize
]

{ #category : #'instance creation' }
PangoFontDescription class >> newFromString: aString [

	^ (self pango_font_description_from_string: aString) initialize
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_from_string: str [
	^ self ffiCall: #(PangoFontDescription *pango_font_description_from_string (const char *str))
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_new [
	^ self ffiCall: #(PangoFontDescription *pango_font_description_new ())
]

{ #category : #accessing }
PangoFontDescription >> familyName [
	
	^ self ffiCall: #(String pango_font_description_get_family (self))
]

{ #category : #accessing }
PangoFontDescription >> familyName: family [ 

	^ self ffiCall: #(void pango_font_description_set_family(self, String family))
]

{ #category : #finalization }
PangoFontDescription >> finalize [

	handle isNull ifTrue: [ ^ self ].
	GRunLoop defer: [  
		self free.
		handle beNull ]
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
PangoFontDescription >> free [

	self ffiCall: #(void pango_font_description_free (self))
]

{ #category : #private }
PangoFontDescription >> getSize [

	^ self ffiCall: #(gint pango_font_description_get_size ( self ))
]

{ #category : #'accessing font size' }
PangoFontDescription >> hasSizeInDeviceUnits [
	"Answer whether the font size is expressed in terms of points or device units.

   The conversion factor between points and device units depends on
   system configuration and the output device. For screen display, a
   logical DPI of 96 is common, in which case a 10 point font corresponds
   to a 10 * (96 / 72) = 13.3 pixel (device unit) font."

	^ self ffiCall: #(Boolean pango_font_description_get_size_is_absolute (self))
]

{ #category : #private }
PangoFontDescription >> setSize: size [

	^ self ffiCall: #(void pango_font_description_set_size ( self, gint size ))
]

{ #category : #'accessing font size' }
PangoFontDescription >> sizeInDeviceUnits: anInteger [

	self ffiCall: #(void pango_font_description_set_size(self, uint anInteger))
]

{ #category : #'accessing font size' }
PangoFontDescription >> sizeInPoints: aFloat [

	self ffiCall: #(void pango_font_description_set_absolute_size(self, double aFloat))
]

{ #category : #'accessing font size' }
PangoFontDescription >> sizeInPointsOrDeviceUnits [

	^ self ffiCall: #(uint pango_font_description_get_size(self))
]

{ #category : #accessing }
PangoFontDescription >> toFileName [

	^ self ffiCall: #(char *pango_font_description_to_filename ( self ))
]

{ #category : #accessing }
PangoFontDescription >> toString [

	^ self ffiCall: #(char *pango_font_description_to_string ( self ))
]
