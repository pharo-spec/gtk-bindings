"
The PangoFontFamily structure is used to represent a family of related font faces. The faces in a family share a common design, but differ in slant, weight, width and other aspects.

https://developer.gnome.org/pango/stable/pango-Fonts.html#PangoFontFamily-struct
"
Class {
	#name : #PangoFontFamily,
	#superclass : #PangoObject,
	#category : #'Pango-Base'
}

{ #category : #accessing }
PangoFontFamily >> name [

	^ self ffiCall: #(const char* pango_font_family_get_name (self))
]
