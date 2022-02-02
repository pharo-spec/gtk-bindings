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
		| fontLayout |
		fontLayout := PangoLayout newCanvas: canvas.
		fontLayout fontDescription: fontDescription.
		fontLayout markup: '<span foreground="blue" font_family="Helvetica">
		<b> bold </b>
		<u> is </u>
		<i> nice </i>
	</span>
	<tt> hello </tt>
	 <span font_family="sans" font_stretch="ultracondensed" letter_spacing="500" font_weight="light"> SANS</span><span foreground="#FFCC00"> colored</span>
	'.
		canvas showLayout: fontLayout ].

	surface asForm inspect

]

{ #category : #examples }
PangoExamples class >> example2Text [
	<example>
	| fontDescription surface pangoScale fontLayout extent padding |
	
	pangoScale := 1024. "Pango requires this scale for measures"
	padding := 20@20.
	fontDescription := PangoFontDescription newFromString: 'Helvetica 40'.
	surface := AthensCairoSurface width: 300 height: 200.
	surface drawDuring: [ :canvas |
		fontLayout := PangoLayout newCanvas: canvas.
		fontLayout
			fontDescription: fontDescription;
			text: 'é è à ô ü ö ß ä ó ñ í á';
			width: surface width * pangoScale. "Wrapping to new line"
		extent := fontLayout size / pangoScale.

		surface clear: Color white.

		canvas pathTransform translateBy: padding.

		canvas
			updateLayout: fontLayout;
			setStrokePaint: Color green;
			drawShape: (1@1 corner: extent);
			showLayout: fontLayout ].

	surface asForm inspect

]

{ #category : #'see class side' }
PangoExamples >> seeClassSide [
]
