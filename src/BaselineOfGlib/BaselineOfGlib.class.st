Class {
	#name : #BaselineOfGlib,
	#superclass : #BaselineOf,
	#category : #BaselineOfGlib
}

{ #category : #baselines }
BaselineOfGlib >> baseline: spec [
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
				
				"GLib standalone engine and tests"
				package: 'GlibStandaloneEngine' with: [ spec requires: #('GObject') ];
				package: 'GlibStandaloneEngine-Test' with: [ spec requires: #('GlibStandaloneEngine') ].
		].

		spec 
			group: 'default' with: #('GLib');
			group: 'GIO' with: #('GLib' 'GLib-IO');
			group: 'GIO-standalone' with: #('GIO' 'GlibStandaloneEngine'). 

]

{ #category : #script }
BaselineOfGlib >> postLoad [

	self recompileStructures
]

{ #category : #script }
BaselineOfGlib >> recompileStructures [
	"Recompile structures (just to be sure we match everything we need"

	(Smalltalk classNamed: #GEnumeration) ifNotNil: [ :c | c allSubclassesDo: #initializeEnumeration ].
	(Smalltalk classNamed: #GStructure) ifNotNil: [ :c | c allSubclassesDo: #compileFields ].
]
