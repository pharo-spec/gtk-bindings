"
I'm a container with just one child.

https://developer.gnome.org/gtk3/stable/GtkBin.html
"
Class {
	#name : 'GtkBin',
	#superclass : 'GtkContainer',
	#traits : 'GtkTBin',
	#classTraits : 'GtkTBin classTrait',
	#instVars : [
		'child'
	],
	#pools : [
		'GtkOrientation'
	],
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'testing' }
GtkBin class >> isDeprecated [

	^ super isDeprecated or: [ self = GtkBin ]
]

{ #category : 'accessing' }
GtkBin >> add: aWidget [

	self 
		deprecated: 'Use #child: instead.' 
		transformWith: '`@receiver add: `@arg1' -> '`@receiver child: `@arg1'.

	child ifNotNil: [ 
		GtkError signal: 'Bin container already contains a widget!' ].
	^ self child: aWidget
]
