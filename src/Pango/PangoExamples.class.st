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
	| fontDescription surface pangoLayout extent padding |
	
	padding := 20@20.
	fontDescription := PangoFontDescription newFromString: 'Arial Black 60'.
	surface := AthensCairoSurface width: 500 height: 250.
	surface drawDuring: [ :canvas |
		pangoLayout := PangoLayout newCanvas: canvas.
		pangoLayout
			fontDescription: fontDescription;
			width: surface width pangoScaled; "Wrap to new line"
			text: 'é è à ô ü ö ß ä ó ñ í á'.
		extent := pangoLayout size pangoUnscaled.

		surface clear: Color white.

		canvas pathTransform translateBy: padding.

		canvas
			setStrokePaint: Color green darker;
			drawShape: (1@1 corner: extent);  "Bug if you don't draw something with the colotr beefoore showLayout:"
			updateLayout: pangoLayout;
			showLayout: pangoLayout ].

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
PangoExamples class >> example5DrawWithoutLayout [
	<example>

	| string fontMap context fontDescription surface pangoItems glyphItems |
	string := 'Hello World'.
	fontMap := PangoFontMap getDefault.
	context := fontMap newPangoContext.
	fontDescription := PangoFontDescription newFromString: 'Arial Black 60'.

	self shouldBeImplemented.
"	pangoItems := context itemize: string attributes: PangoAttrList new.
	(https://docs.gtk.org/Pango/func.itemize.html)
	
	glyphItems := pangoItems collect: [ :each | context shapePangoItem: each text: string ].
	(https://docs.gtk.org/Pango/func.shape_item.html)
"
	surface := AthensCairoSurface width: 200 height: 135.
	surface drawDuring: [ :canvas |
		glyphItems do: [ :each |
			canvas showGlyphItem: each text: string ] ].

	surface asForm inspect

]

{ #category : #'see class side' }
PangoExamples >> seeClassSide [
]
