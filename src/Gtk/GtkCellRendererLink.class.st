Class {
	#name : #GtkCellRendererLink,
	#superclass : #GtkCellRendererCustom,
	#instVars : [
		'text'
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

{ #category : #initialization }
GtkCellRendererLink >> getProperty: id inValue: gValue [

	id = 1 ifTrue: [ gValue setString: text ]
]

{ #category : #rendering }
GtkCellRendererLink >> getSize: widget rectangle: rect xOffset: xOffset yOffset: yOffset width: width height: height [ 

	
	xOffset ifNotNil: [ xOffset signedLongAt: 1 put: 2 ].
	yOffset ifNotNil: [ yOffset signedLongAt: 1 put: 2 ].
]

{ #category : #'instance creation' }
GtkCellRendererLink >> newPangoLayout [

	
]

{ #category : #rendering }
GtkCellRendererLink >> renderCr: cr widget: widget backgroundArea: bgRect cellArea: cellRect flags: flags [
	| layout padding context x y canvas |

	context := widget styleContext.
	context save.
	context addClass: 'cell-link'.
	
	layout := widget createPangoLayout: text.	
	layout width: -1.
	
	padding := self padding.
	
	x := cellRect x + padding x.
	y := cellRect y + padding y.
	
	canvas := AthensCairoCanvas fromHandle: cr.
	canvas primSaveState.
	context renderLayout: layout cr: cr x: x y: y.
	canvas primRestoreState.
	context restore
]

{ #category : #initialization }
GtkCellRendererLink >> setProperty: id toValue: gValue [

	id = 1 ifTrue: [ text := gValue getString ]
]
