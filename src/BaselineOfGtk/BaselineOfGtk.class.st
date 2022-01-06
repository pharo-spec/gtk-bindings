Class {
	#name : #BaselineOfGtk,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtk
}

{ #category : #baseline }
BaselineOfGtk >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ 
			spec postLoadDoIt: #postLoad.

			spec
				"core"
				package: 'GObject';
				package: 'GLib' with: [ spec requires: #('GObject') ];
				package: 'GLib-IO' with: [ spec requires: #('GLib') ];
				package: 'Gdk' with: [ spec requires: #('GObject') ];
				package: 'Pango' with: [ spec requires: #('GObject') ];
				package: 'Gtk' with: [ spec requires: #('GObject' 'GLib' 'Gdk' 'Pango') ];
				"code"
				package: 'GtkSourceView' with: [ spec requires: #('Gtk') ];
				"morphic"
				package: 'Gtk-FreeType' with: [ spec requires: #('Gtk') ];
				package: 'Gtk-Morphic' with: [ spec requires: #('Gtk-FreeType' 'Gtk') ];
				package: 'Gtk-Morphic-UIManager' with: [ spec requires: #('Gtk-Morphic') ];
				"testing"
				package: 'Gtk-Tests' with: [ spec requires: 'Gtk' ];
				"testing morphic"
				package: 'Gtk-Morphic-Tests' with: [ spec requires: 'Gtk-Morphic' ] ].
		
		spec group: 'Core' with: #('Pango' 'Gtk').
		spec group: 'Code' with: #('Core' 'GtkSourceView').
		spec group: 'Morphic' with: #('Core' 'Gtk-FreeType' 'Gtk-Morphic' 'Gtk-Morphic-UIManager').
		spec group: 'Tests' with: #('Gtk-Tests').
		spec group: 'MorphicTests' with: #('Gtk-Morphic-Tests').
		
		spec group: 'Base' with: #('Core' 'Code').
		
		spec group: 'default' with: #('Base' 'GLib-IO' 'Tests' 'Morphic' 'MorphicTests')
]

{ #category : #doits }
BaselineOfGtk >> installGtkDriver [
			
	"Do not switch driver if we are not in MacOS (it is not working there)"
	self flag: #TODO. "Hopefully temporal :)"
	Smalltalk platform isMacOS ifFalse: [ ^ self ]. 
			
	"If we installed OSGtkDriver, we want to use it as default"
	Smalltalk globals
		at: #OSGtkDriver
		ifPresent: [ :driverClass | OSWindowDriver driverClass: driverClass ]
]

{ #category : #doits }
BaselineOfGtk >> postLoad [

	self installGtkDriver.
	self recompileStructures
]

{ #category : #doits }
BaselineOfGtk >> recompileStructures [
	"Recompile structures (just to be sure we match everything we need"

	(Smalltalk at: #GEnumeration) allSubclassesDo: #initializeEnumeration.
	(Smalltalk at: #GStructure) allSubclassesDo: #compileFields.
	(Smalltalk at: #GtkWidget) withAllSubclassesDo: #recompile
]
