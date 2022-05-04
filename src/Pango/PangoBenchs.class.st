Class {
	#name : #PangoBenchs,
	#superclass : #Object,
	#instVars : [
		'aString',
		'extent',
		'pangoLayoutBench',
		'plainCairoSurface',
		'plainCairoBench',
		'pangoLayoutSurface',
		'pangoLowLevelSurface',
		'pangoLowLevelBench'
	],
	#category : #'Pango-Examples'
}

{ #category : #examples }
PangoBenchs class >> example [

	| instance |
	instance := self new
		runPangoLowLevel;
		runPangoLayout;
		runPlainCairo;
		yourself.
		
	instance inspect; inspectForms; printBenchs.
]

{ #category : #initialization }
PangoBenchs >> initialize [
	super initialize.

	aString := (String loremIpsum: 50) utf8Encoded.
	extent := 400 @ 100.


]

{ #category : #'as yet unclassified' }
PangoBenchs >> inspectForms [

	((#(pangoLayoutSurface pangoLowLevelSurface plainCairoSurface) 
		collect: [ :each | each -> (self instVarNamed: each) ])
		reject: [ :each | each value isNil ])
		do: [ :each | each value asForm inspectWithLabel: each key ]
]

{ #category : #'as yet unclassified' }
PangoBenchs >> printBenchs [

	#(pangoLayoutBench pangoLowLevelBench plainCairoBench) do: [ :each |
		(each padRightTo: 20) trace.
		(self instVarNamed: each) traceCr  ]
]

{ #category : #initialization }
PangoBenchs >> runPangoLayout [
	<script: 'self new runPangoLayout inspectForms'>

	pangoLayoutSurface := AthensCairoSurface extent: extent.
	pangoLayoutSurface drawDuring: [ :canvas |

		| pangoLayout |
		pangoLayout := PangoLayout newCanvas: canvas.
		pangoLayout
			fontDescription: (PangoFontDescription newFromString: 'Arial 11');
			text: aString.

		pangoLayoutBench := [ canvas showLayout: pangoLayout ] bench.
		].

]

{ #category : #initialization }
PangoBenchs >> runPangoLowLevel [
	<script: 'self new runPangoLowLevel inspectForms'>

	| fontMap context fontDescription font pangoItems glyphs pangoGlyph logicalBounds |
	pangoLowLevelSurface := AthensCairoSurface extent: extent.
	pangoLowLevelSurface drawDuring: [ :canvas |

		fontMap := PangoFontMap getDefault.
		context := fontMap newPangoContext.
		fontDescription := PangoFontDescription newFromString: 'Arial 11'.
		font := context loadFontDescription: fontDescription.
		
		pangoItems := context itemize: aString.
		glyphs := pangoItems collect: [ :each |
			PangoGlyphString shape: aString analysis: each analysis ].
		self assert: [ glyphs size = 1 ].
		"Reference the sole item from the collection"
		pangoGlyph := glyphs first.

		"Translate to draw inside the surface"
		logicalBounds := pangoGlyph logicalRectangleWithFont: font.
		canvas pathTransform
			translateBy: logicalBounds origin negated.

		"Workaround: glyphs are shown with last color used by the
		Athens canvas in the previous drawing operation."
		canvas
			setStrokePaint: Color black;
			drawShape: (1@1 corner: 1@1).

		pangoLowLevelBench := [
			canvas
				showGlyphString: pangoGlyph
				font: font ] bench.

	]

]

{ #category : #initialization }
PangoBenchs >> runPlainCairo [
	<script: 'self new runPlainCairo inspectForms'>

	| aCanvas aLabel |
	aCanvas := RSCanvas new.
	aLabel := RSLabel new
		fontName: 'Arial'; 
		text: aString;
		color: Color black;
		fontSize: 11.
	aCanvas add: aLabel.

	plainCairoSurface := AthensCairoSurface extent: extent.
	plainCairoSurface drawDuring: [ :athensCanvas |

		| renderer font |
		renderer := RSAthensRenderer new.
		renderer canvas: athensCanvas.
		athensCanvas pathTransform
			translateBy: aLabel extent // 2.

		athensCanvas pathTransform
			translateBy: aLabel textExtents translationPoint. 
		athensCanvas setPathMatrix.

		font := aLabel cairoFont.
		(aLabel paint asAthensPaintOn: athensCanvas)
			loadOnCairoCanvas: athensCanvas.

		plainCairoBench := [
			font lock.
			athensCanvas setScaledFont: font.

			athensCanvas
				showGlyphs: aLabel cairoGlyphs getHandle
				size: aLabel cairoGlyphs size.

			font unlock.
		] bench.
			
		].
]
