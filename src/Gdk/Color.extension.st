Extension { #name : 'Color' }

{ #category : '*Gdk' }
Color >> asGdkRGBA [

	^ GdkRGBA 
		r: self red 
		g: self green 
		b: self blue 
		alpha: self alpha
]

{ #category : '*Gdk' }
Color >> asHexStringWithAlpha [
	"Return a string representing the receiver in HEX including alpha (RRGGBBAA).
	 (Color red asHexStringWithAlpha) >>> 'FF0000FF'
	 (Color red alpha: 0.5) asHexStringWithAlpha >>> 'FF00007F'"
	| hexString |
	
	hexString := '00000000' copy.
	hexString at: 1 put: (Character digitValue: ((rgb bitShift: -6 - RedShift) bitAnd: 15)).
	hexString at: 2 put: (Character digitValue: ((rgb bitShift: -2 - RedShift) bitAnd: 15)).
	hexString at: 3 put: (Character digitValue: ((rgb bitShift: -6 - GreenShift) bitAnd: 15)).
	hexString at: 4 put: (Character digitValue: ((rgb bitShift: -2 - GreenShift) bitAnd: 15)).
	hexString at: 5 put: (Character digitValue: ((rgb bitShift: -6 - BlueShift) bitAnd: 15)).
	hexString at: 6 put: (Character digitValue: ((rgb bitShift: -2 - BlueShift) bitAnd: 15)).
	hexString at: 7 put: (Character digitValue: ((alpha bitShift: -4) bitAnd: 15)).
	hexString at: 8 put: (Character digitValue: (alpha bitAnd: 15)).
	
	^ hexString
]
