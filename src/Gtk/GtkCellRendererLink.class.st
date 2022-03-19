Class {
	#name : #GtkCellRendererLink,
	#superclass : #GtkCellRendererCustom,
	#instVars : [
		'text',
		'linkPrototype'
	],
	#category : #'Gtk-Widget-CellRenderers'
}

{ #category : #'class initialization' }
GtkCellRendererLink class >> gInitializeClassInstallPropertiesOn: aDefinition [

	aDefinition
		installPropertyStringId: 1
		name: 'text' 
		nick: 'text' 
		blurb: 'text'
		default: nil
		flags: GParamFlags G_PARAM_READWRITE
]

{ #category : #'accessing - properties' }
GtkCellRendererLink >> getProperty: id inValue: gValue [

	id = 1 ifTrue: [ gValue setString: text ]
]

{ #category : #rendering }
GtkCellRendererLink >> getSize: widget rectangle: rect xOffset: xOffset yOffset: yOffset width: width height: height [ 

	
	xOffset ifNotNil: [ xOffset signedLongAt: 1 put: 2 ].
	yOffset ifNotNil: [ yOffset signedLongAt: 1 put: 2 ].
]

{ #category : #private }
GtkCellRendererLink >> linkPrototype [
	
	^ linkPrototype ifNil: [ 
		linkPrototype := ((GtkLinkButton newWithUri: '')
			addClass: 'hover';
			addClass: 'cell-link';
			yourself) ]
]

{ #category : #rendering }
GtkCellRendererLink >> renderCr: cr widget: widget backgroundArea: bgRect cellArea: cellRect flags: flags [
	| layout padding context x y canvas attrs |

	context := self linkPrototype styleContext.
	layout := self linkPrototype createPangoLayout: text.	
	attrs := PangoAttrList new.
	"for some reason, 'text-decoration-line' css property is not working, so I 
	 add the underline manually. "
	attrs add: (PangoAttribute newUnderline: 1).
	layout setAttributes: attrs.

	layout width: -1.
	
	padding := self padding.
	
	x := cellRect x + padding x.
	y := cellRect y + padding y.
	
	canvas := AthensCairoCanvas fromHandle: cr.
	canvas primSaveState.
	context renderLayout: layout cr: cr x: x y: y.
	canvas primRestoreState
]

{ #category : #'accessing - properties' }
GtkCellRendererLink >> setProperty: id toValue: gValue [

	id = 1 ifTrue: [ text := gValue getString ]
]
