Class {
	#name : #BaselineOfPango,
	#superclass : #BaselineOf,
	#category : #BaselineOfPango
}

{ #category : #baseline }
BaselineOfPango >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ 
			self glib: spec.

			spec
				package: 'Pango' with: [ spec requires: #('Glib') ]].	

]

{ #category : #baseline }
BaselineOfPango >> glib: spec [

	spec baseline: 'Glib' with: [ 
		spec
			loads: #('default'); 
			repository: self packageRepositoryURL ].

]
