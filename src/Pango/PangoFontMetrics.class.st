"
https://developer.gnome.org/pango/stable/pango-Fonts.html#PangoFontMetrics
"
Class {
	#name : 'PangoFontMetrics',
	#superclass : 'PangoObject',
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'accessing' }
PangoFontMetrics class >> scale [

	^ 1024
]

{ #category : 'accessing' }
PangoFontMetrics >> approximateCharWidth [

	^ self ffiCall: #(int pango_font_metrics_get_approximate_char_width (self))
]

{ #category : 'accessing' }
PangoFontMetrics >> approximateDigitWidth [

	^ self ffiCall: #(int pango_font_metrics_get_approximate_digit_width (self))
]

{ #category : 'accessing' }
PangoFontMetrics >> approximateScaledWidth [
	| max |

	max := self approximateCharWidth max: self approximateDigitWidth.
	^ (max + self class scale - 1) // self class scale
]

{ #category : 'accessing' }
PangoFontMetrics >> height [

	^ self ffiCall: #(int pango_font_metrics_get_height (self))
]

{ #category : 'accessing' }
PangoFontMetrics >> scaledHeight [

	^ (self height + self class scale - 1) // self class scale
]
