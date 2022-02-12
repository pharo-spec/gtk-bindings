"
A PangoLayoutTest is a test class for testing the behavior of PangoLayout
"
Class {
	#name : #PangoLayoutTest,
	#superclass : #TestCase,
	#category : #'Pango-Tests-Base'
}

{ #category : #test }
PangoLayoutTest >> testMarkupOnNewCanvas [

	| surface |
	surface := AthensCairoSurface width: 300 height: 300.
	surface drawDuring: [ :canvas |
		| fontLayout |
		fontLayout := PangoLayout newCanvas: canvas.
		fontLayout markup: '<span foreground="blue">
		<b> bold </b>
		<u> is </u>
		<i> nice </i>
	</span>
	<tt> hello </tt>
	 <span font_family="sans" font_stretch="ultracondensed" letter_spacing="500" font_weight="light"> SANS</span><span foreground="#FFCC00"> colored</span>
	'.
		canvas showLayout: fontLayout ].

	"surface asForm inspect"
]

{ #category : #test }
PangoLayoutTest >> testNewForContext [ 

	| aLayout |
	aLayout := PangoLayout newContext: PangoFontMap getDefault newPangoContext.
	self assert: aLayout class equals: PangoLayout.
]
