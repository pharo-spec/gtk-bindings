"
I run benchmarks to compare performance for rendering basic text of Pango vs. Plain Cairo.

See my class side.
"
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

{ #category : #debugging }
PangoBenchs >> inspectForms [

	((#(pangoLayoutSurface pangoLowLevelSurface plainCairoSurface) 
		collect: [ :each | each -> (self instVarNamed: each) ])
		reject: [ :each | each value isNil ])
		do: [ :each | each value asForm inspectWithLabel: each key ]
]

{ #category : #debugging }
PangoBenchs >> printBenchs [

	#(pangoLayoutBench pangoLowLevelBench plainCairoBench) do: [ :each |
		(each padRightTo: 25) trace.
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

		pangoLayoutBench := [
			canvas showLayout: pangoLayout
			] bench.
		].

]

{ #category : #initialization }
PangoBenchs >> runPangoLowLevel [
	<script: 'self new runPangoLowLevel inspectForms'>

	| fontMap context fontDescription font pangoItems glyphs pangoGlyph logicalBounds |
	pangoLowLevelSurface := AthensCairoSurface extent: extent.
	pangoLowLevelSurface drawDuring: [ :athensCanvas |

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
		athensCanvas pathTransform translateBy: logicalBounds origin negated.
		athensCanvas setPathMatrix. "Apply pathTransformation in the cairo context"

		pangoLowLevelBench := [
			athensCanvas showGlyphString: pangoGlyph font: font
			] bench.

	]

]

{ #category : #initialization }
PangoBenchs >> runPlainCairo [
	<script: 'self new runPlainCairo inspectForms'>

	| aLabel |
	aLabel := RSLabel new
		fontName: 'Arial'; 
		text: aString;
		fontSize: 11.

	plainCairoSurface := AthensCairoSurface extent: extent.
	plainCairoSurface drawDuring: [ :athensCanvas |

		| renderer font |
		renderer := RSAthensRenderer new.
		renderer canvas: athensCanvas.

"		metrics := RSCairoMetricsProvider new extentsOf: aLabel."
		athensCanvas pathTransform
			translateBy: aLabel extent // 2;
			translateBy: aLabel textExtents translationPoint. 
		athensCanvas setPathMatrix. "Apply pathTransformation in the cairo context"


		plainCairoBench := [
			font := aLabel cairoFont.
			font lock.

			athensCanvas
				setScaledFont: font;
				showGlyphs: aLabel cairoGlyphs getHandle
					size: aLabel cairoGlyphs size.

			font unlock.
			] bench.
		
		].
]
