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
	fontSize := 18.
	numberOfFamilies := 12.
	surface := AthensCairoSurface width: 300 height: fontSize * 2 * numberOfFamilies.
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
				fontDescription familyName: aFamily name.
				pangoLayout := (PangoLayout newCanvas: canvas)
					fontDescription: fontDescription;
					text: aFamily name;
					yourself.

				Color random loadOnCairoCanvas: canvas.
				canvas showLayout: pangoLayout ]

			separatedBy: [
				canvas pathTransform
					translateBy: 0 @ fontSize * 2.
				canvas setPathMatrix. "Apply pathTransform"
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
				translateBy: logicalBounds origin negated.
			
			"Draw 'ink' bounds"
			(canvas setStrokePaint: Color green) width: 0.25.
			canvas drawShape: inkBounds.
			
			"Draw 'logical' bounds"
			(canvas setStrokePaint: Color red) width: 0.25.
			canvas drawShape: logicalBounds.

			"Draw glyphs"
			Color black loadOnCairoCanvas: canvas.
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
		add: (PangoAttribute newForegroundColor: Color blue);
		yourself.
	
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
			| logicalBounds |
			
			"Calculate extents"
			logicalBounds := each logicalRectangleWithFont: font.

			canvas pathTransform
				scaleBy: 4.0;
				translateBy: logicalBounds origin negated.
			canvas setPathMatrix. "Apply pathTransformation in the cairo context"
			Color black loadOnCairoCanvas: canvas.

			"Draw glyphs"
			canvas showGlyphString: each font: font
			]
		].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example7LayoutNoMarkup [
	<example>

	| surface attributeList |
	surface := AthensCairoSurface width: 250 height: 200.
	surface drawDuring: [ :canvas |

		| pangoLayout |
		pangoLayout := PangoLayout newCanvas: canvas.
		pangoLayout
			"default font"
			fontDescription: (PangoFontDescription newFromString: 'Arial 16');
			"wrap text at this width"
			width: surface width pangoScaled;
			height: surface height pangoScaled;
			"More!"
			setJustify: true;
			setLineSpacing: 1.5.

		attributeList := PangoAttrList new
			add: (PangoAttribute newForegroundColor: Color blue muchDarker);
			add: (PangoAttribute newBackgroundColor: Color paleOrange);
			add: (PangoAttribute newFontDescription: 
					(PangoFontDescription newFromString: 'Arial Black 30'))
				from: 0
				to: 5;
			add: (PangoAttribute newForegroundColor: Color orange)
				from: 0
				to: 5;
			add: (PangoAttribute newBackgroundColor: Color paleGreen)
				from: 6
				to: 11;
			add: (PangoAttribute newUnderline: 1)
				from: 12
				to: 17;
			add: (PangoAttribute newUnderline: 2)
				from: 18
				to: 21;
			yourself.

		"set text and its attributes"
		pangoLayout
			text: (String loremIpsum: 75);
			setAttributes: attributeList.

		surface clear: Color white.
		canvas showLayout: pangoLayout
		].

	surface asForm inspect

]

{ #category : #'see class side' }
PangoExamples >> seeClassSide [
]
