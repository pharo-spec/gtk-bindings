Class {
	#name : #PangoExamples,
	#superclass : #Object,
	#category : #'Pango-Examples'
}

{ #category : #examples }
PangoExamples class >> example1Markup [
	<example>
	| fontDescription surface |
	
	fontDescription := PangoFontDescription newFromString: 'Helvetica 28'.
	surface := AthensCairoSurface width: 500 height: 500.
	surface drawDuring: [ :canvas |
		| pangoLayout |
		pangoLayout := PangoLayout newCanvas: canvas.
		pangoLayout fontDescription: fontDescription.
		pangoLayout markup: '<span foreground="blue" font_family="Helvetica">
		<b> bold </b>
		<u> is </u>
		<i> nice </i>
	</span>
	<tt> hello </tt>
	 <span font_family="sans" font_stretch="ultracondensed" letter_spacing="500" font_weight="light"> SANS</span><span foreground="#FFCC00"> colored</span>
	'.
		canvas showLayout: pangoLayout ].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example2Text [
	<example>
	| fontDescription surface pangoLayout extent baselineY |
	
	fontDescription := PangoFontDescription newFromString: 'Arial Black 60'.
	surface := AthensCairoSurface width: 500 height: 250.
	surface drawDuring: [ :canvas |
		"Some padding"
		surface clear: Color white.
		canvas pathTransform translateBy: 20 @ 20.

		"Layout some text"
		pangoLayout := PangoLayout newCanvas: canvas.
		pangoLayout
			fontDescription: fontDescription;
			width: surface width pangoScaled; "Wrap to new line"
			text: 'é è à ô ü ö ß ä ó ñ í á'.

		"Get some metrics from the layout"
		baselineY := pangoLayout baseline pangoUnscaled.
		extent := pangoLayout size pangoUnscaled.

		"Contour the text"
		canvas
			setStrokePaint: Color black;
			drawShape: (0@0 corner: extent).  

		"Draw baseline indicator"
		canvas
			drawShape: (0 @ baselineY corner: -10 @ baselineY).

		canvas
"			updateLayout: pangoLayout;"
			showLayout: pangoLayout
		].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example3CreateLayoutFromContext [
	<example>

	| surface pangoLayout fontMap context |
	fontMap := PangoFontMap getDefault.
	context := fontMap newPangoContext.

	surface := AthensCairoSurface width: 200 height: 135.

	pangoLayout := PangoLayout newContext: context.
	pangoLayout
		text: String loremIpsum;
		width: surface width pangoScaled.

	surface drawDuring: [ :canvas |
		canvas showLayout: pangoLayout ].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example4ListFamilies [
	<example>

	| surface numberOfFamilies fontFamilies fontSize |
	fontSize := 48.
	numberOfFamilies := 5.
	surface := AthensCairoSurface width: 500 height: fontSize * 2 * numberOfFamilies.
	fontFamilies := PangoFontMap getDefault listFamilies.

	surface drawDuring: [ :canvas |
		| fontDescription pangoLayout |
		surface clear: Color white.

		fontDescription := PangoFontDescription new
			sizeInDeviceUnits: fontSize pangoScaled;
			yourself.

		(1 to: numberOfFamilies)
			do: [ :_ | 
				| aFamily |
				aFamily := fontFamilies atRandom.

				canvas
					setStrokePaint: Color random;
					drawShape: (1@1 corner: 2@2).  
				"--> Workaround a bug that happens unless something else is 
				draw before showLayout:"

				fontDescription familyName: aFamily name.
				pangoLayout := (PangoLayout newCanvas: canvas)
					fontDescription: fontDescription;
					text: aFamily name;
					yourself.
				canvas showLayout: pangoLayout ]

			separatedBy: [
				canvas pathTransform
					translateBy: 0 @ fontSize * 2.
				canvas updateLayout: pangoLayout ]
		].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example5Shape [
	"An example of pango_itemize and pango_shape. 
	Documentation recommends using pango_shape_full instead.
	See: https://docs.gtk.org/Pango/func.shape.html"
	<example>

	| string fontMap context fontDescription surface pangoItems glyphs font |
	string := 'Jellóu güorld' utf8Encoded.
	fontMap := PangoFontMap getDefault.
	context := fontMap newPangoContext.
	fontDescription := PangoFontDescription newFromString: 'Arial 11'.
	font := context loadFontDescription: fontDescription.
	
	pangoItems := context itemize: string.
	glyphs := pangoItems collect: [ :each |
		PangoGlyphString shape: string analysis: each analysis ].

	surface := AthensCairoSurface width: 400 height: 100.

	surface drawDuring: [ :canvas |
		surface clear: Color white.

		glyphs do: [ :each |
			| extentsArray logicalBounds inkBounds |
			
			"Calculate extents"
			extentsArray := each extentsWithFont: font.
			inkBounds := extentsArray first asRectangle.
			logicalBounds := extentsArray second asRectangle.

			canvas pathTransform
				scaleBy: 4.0;
				translateX: logicalBounds left negated Y: logicalBounds top negated.
			
			"Draw 'ink' bounds"
			(canvas setStrokePaint: Color green) width: 0.25.
			canvas drawShape: inkBounds.
			
			"Draw 'logical' bounds"
			(canvas setStrokePaint: Color red) width: 0.25.
			canvas drawShape: logicalBounds.

			"Workaround: glyphs are shown with last color used by the
			Athens canvas in the previous drawing operation."
			canvas
				setStrokePaint: Color black;
				drawShape: (1@1 corner: 1@1).

			"Draw glyphs"
			canvas showGlyphString: each font: font
			]
		].

	surface asForm inspect
]

{ #category : #examples }
PangoExamples class >> example6ShapeFull [
	"An example of pango_itemize and pango_shape_full, and drawing bounds.
	See: https://docs.gtk.org/Pango/func.shape_full.html"
	<example>

	| utf8ByteArray fontMap context fontDescription surface pangoItems glyphs font attributeList |
	fontMap := PangoFontMap getDefault.
	context := fontMap newPangoContext.
	fontDescription := PangoFontDescription newFromString: 'Arial 9'.
	font := context loadFontDescription: fontDescription.

	attributeList := PangoAttrList new
"		add: (PangoAttribute newUnderline: 2);"
		add: (PangoAttribute newForegroundColor: Color blue);
"		add: (PangoAttribute newBackgroundColor: Color yellow);
		add: ((PangoAttribute newFontDescription: (PangoFontDescription newFromString: 'Arial 12'))
			start_index: 1;
			end_index: 3;
			yourself);
"		yourself.
	
	utf8ByteArray := 'Hello World!' utf8Encoded.
	pangoItems := context
		itemize: utf8ByteArray
		attributes: attributeList.
	glyphs := pangoItems collect: [ :each |
		PangoGlyphString
			shapeFull: utf8ByteArray
			paragraph: utf8ByteArray
			analysis: each analysis ].

	surface := AthensCairoSurface width: 400 height: 100.
	surface drawDuring: [ :canvas |
		surface clear: Color white.

		glyphs do: [ :each |
			| extentsArray logicalBounds |
			
			"Calculate extents"
			extentsArray := each extentsWithFont: font.
			logicalBounds := extentsArray second asRectangle.

			canvas pathTransform
				scaleBy: 4.0;
				translateX: logicalBounds left negated Y: logicalBounds top negated.

			"Workaround: glyphs are shown with last color used by the
			Athens canvas in the previous drawing operation."
			canvas
				setStrokePaint: Color black;
				drawShape: (1@1 corner: 1@1).

			"Draw glyphs"
			canvas showGlyphString: each font: font
			]
		].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example7ShapeItemCRASH [
	<example>

	| string fontMap context surface pangoItems glyphItems |
	string := 'Hello World'.
	fontMap := PangoFontMap getDefault.
	context := fontMap newPangoContext.

	pangoItems := context itemize: string.
	
	glyphItems := pangoItems collect: [ :each |
		PangoGlyphString shapeItem: each paragraphText: string ].

	surface := AthensCairoSurface width: 400 height: 400.
	surface drawDuring: [ :canvas |
		glyphItems do: [ :each |
"			THIS CRASHES:"
			canvas showGlyphItem: each text: string ] ].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example8LineBreak [
	<example>

	| string fontMap context fontDescription surface pangoItems glyphs font break |
	break := String crlf.
	string := 'Line1' utf8Encoded, break, 'Line2' utf8Encoded.

	PangoLogAttr.

	fontMap := PangoFontMap getDefault.
	context := fontMap newPangoContext.
	fontDescription := PangoFontDescription newFromString: 'Arial 11'.
	font := context loadFontDescription: fontDescription.
	
	pangoItems := context itemize: string.
	glyphs := pangoItems collect: [ :each |
		PangoGlyphString shape: string analysis: each analysis ].

	surface := AthensCairoSurface width: 400 height: 200.

	surface drawDuring: [ :canvas |
		surface clear: Color white.

		glyphs do: [ :each |
			| extentsArray logicalBounds inkBounds |
			
			"Calculate extents"
			extentsArray := each extentsWithFont: font.
			inkBounds := extentsArray first asRectangle.
			logicalBounds := extentsArray second asRectangle.

			canvas pathTransform
				scaleBy: 4.0;
				translateX: logicalBounds left negated Y: logicalBounds top negated.
			
			"Draw 'ink' bounds"
			(canvas setStrokePaint: Color green) width: 0.25.
			canvas drawShape: inkBounds.
			
			"Draw 'logical' bounds"
			(canvas setStrokePaint: Color red) width: 0.25.
			canvas drawShape: logicalBounds.

			"Workaround: glyphs are shown with last color used by the
			Athens canvas in the previous drawing operation."
			canvas
				setStrokePaint: Color black;
				drawShape: (1@1 corner: 1@1).

			"Draw glyphs"
			canvas showGlyphString: each font: font
			]
		].

	surface asForm inspect
]

{ #category : #examples }
PangoExamples class >> example9LayoutNoMarkup [
	<example>

	| fontMap context fontDescription surface attributeList |
	fontMap := PangoFontMap getDefault.
	context := fontMap newPangoContext.
	fontDescription := PangoFontDescription newFromString: 'Arial 20'.

	attributeList := PangoAttrList new
		add: (PangoAttribute newUnderline: 1);
		add: (PangoAttribute newForegroundColor: Color blue);
		add: (PangoAttribute newBackgroundColor: Color yellow);
		"add: ((PangoAttribute newFontDescription: (PangoFontDescription newFromString: 'Arial 10'))"
		yourself.
	
	surface := AthensCairoSurface width: 300 height: 500.
	surface drawDuring: [ :canvas |

		| pangoLayout |
		pangoLayout := PangoLayout newCanvas: canvas.
		pangoLayout
			fontDescription: fontDescription;
			text: String loremIpsum;
			width: surface width pangoScaled;
			setAttributes: attributeList.

		canvas showLayout: pangoLayout
		].

	surface asForm inspect

]

{ #category : #'see class side' }
PangoExamples >> seeClassSide [
]
