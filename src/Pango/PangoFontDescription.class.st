"
I'm a font description

https://developer.gnome.org/pango/stable/pango-Fonts.html#PangoFontDescription
"
Class {
	#name : #PangoFontDescription,
	#superclass : #PangoObject,
	#category : #'Pango-Base'
}

{ #category : #finalization }
PangoFontDescription class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self pango_font_description_free: handle
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
PangoFontDescription class >> pango_font_description_free: desc [
	self ffiCall: #(void pango_font_description_free (void *desc))
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_from_string: str [
	^ self ffiCall: #(PangoFontDescription *pango_font_description_from_string (const char *str))
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_new [
	self ffiCall: #(PangoFontDescription* pango_font_description_new ())
]

{ #category : #accessing }
PangoFontDescription >> absoluteSize: size [

	^ self ffiCall: #( void pango_font_description_set_absolute_size(self , uint size ) )
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
PangoFontDescription >> size [

	^ self ffiCall: #( uint pango_font_description_get_size(self) )
]

{ #category : #accessing }
PangoFontDescription >> size: size [

	^ self ffiCall: #( void pango_font_description_set_size(self , uint size ) )
]

{ #category : #accessing }
PangoFontDescription >> stretch: stretch [

	^ self ffiCall: #( void pango_font_description_set_stretch( self , PangoStretch stretch ) )
]

{ #category : #accessing }
PangoFontDescription >> weight: weight [

	^ self ffiCall: #( void pango_font_description_set_weight( self , PangoStyle weight ) )
]
