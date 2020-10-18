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
			self spec: spec.
			self specCode: spec.
			self specMorphic: spec.
			self threadedffi: spec.
			
			spec postLoadDoIt: #postLoad.

			spec
				"core"
				package: 'Gtk-Pango';
				package: 'Gtk' with: [ spec requires: #('ThreadedFFI' 'Gtk-Pango') ];
				"code"
				package: 'Gtk-SourceView' with: [ spec requires: #('Gtk') ];
				"morphic"
				package: 'Gtk-Morphic' with: [ spec requires: #('Gtk') ];
				package: 'Gtk-Morphic-UIManager' with: [ spec requires: #('Gtk-Morphic') ];
				"testing"
				package: 'Gtk-Tests' with: [ spec requires: 'Gtk' ] ].
		
		spec group: 'Core' with: #('SpecCore' 'Gtk-Pango' 'Gtk' 'Mars-Spec-Frame').
		spec group: 'Code' with: #('Gtk-SourceView').
		spec group: 'Morphic' with: #('Gtk-Morphic' 'Gtk-Morphic-UIManager').
		spec group: 'Tests' with: #('Gtk-Tests').
		spec group: 'MorphicTests' with: #('Gtk-Morphic-Tests').
		
		spec group: 'Base' with: #('Core' 'Code').
		
		spec group: 'default' with: #('Base' 'Tests' 'Morphic' 'MorphicTests')
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

	(Smalltalk at: #GtkEnumeration) allSubclassesDo: #initializeEnumeration.
	(Smalltalk at: #GtkStructure) allSubclassesDo: #compileFields.
	(Smalltalk at: #GtkWidget) withAllSubclassesDo: #recompile
]

{ #category : #'external projects' }
BaselineOfGtk >> spec: spec [

	spec baseline: 'SpecCore' with: [ 
		spec 
			repository: 'github://pharo-spec/Spec';
			loads: 'Core' ]
]

{ #category : #'external projects' }
BaselineOfGtk >> specCode: spec [

	spec baseline: 'SpecCode' with: [ 
		spec 
			repository: 'github://pharo-spec/Spec';
			className: 'BaselineOfSpecCore';
			loads: 'Code' ]
]

{ #category : #'external projects' }
BaselineOfGtk >> specMorphic: spec [

	spec baseline: 'SpecMorphic' with: [ 
		spec 
			repository: 'github://pharo-spec/Spec';
			className: 'BaselineOfSpec2' ]
]

{ #category : #'external projects' }
BaselineOfGtk >> threadedffi: spec [

	spec baseline: 'ThreadedFFI' with: [ 
		spec 
			repository: 'github://pharo-project/threadedFFI-Plugin';
			loads: 'Core' ]
]
