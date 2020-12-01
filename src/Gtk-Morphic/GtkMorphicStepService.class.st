"
A service to process stepping of morphs. 
I keep a registry of all stepping morphs and execute the required stepping (by default every 1000ms), but I'm only active if I have morphs registered (otherwise, I will stop until a new morph is registered) 
"
Class {
	#name : #GtkMorphicStepService,
	#superclass : #TKTService,
	#instVars : [
		'mutex',
		'morphs'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Gtk-Morphic'
}

{ #category : #'instance creation' }
GtkMorphicStepService class >> new [

	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
GtkMorphicStepService class >> uniqueInstance [

	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #initialization }
GtkMorphicStepService >> initialize [

	super initialize.
	self stepDelay: 1000 milliseconds.
	mutex := Mutex new.
	morphs := Set new
]

{ #category : #accessing }
GtkMorphicStepService >> name [
	
	^ 'GtkMorphView Step Service'
]

{ #category : #registry }
GtkMorphicStepService >> register: aMorph [

	mutex critical: [ 
		morphs add: aMorph.
		self isRunning ifFalse: [ 
			self start ] ].
]

{ #category : #stepping }
GtkMorphicStepService >> stepService [

	morphs do: #step
]

{ #category : #registry }
GtkMorphicStepService >> unregister: anInspector [

	mutex critical: [ 
		morphs remove: anInspector ifAbsent: [ ].
		morphs ifEmpty: [ 
			self stop ] ]
]
