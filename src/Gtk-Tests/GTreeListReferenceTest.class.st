Class {
	#name : 'GTreeListReferenceTest',
	#superclass : 'TestCase',
	#category : 'Gtk-Tests-Base',
	#package : 'Gtk-Tests',
	#tag : 'Base'
}

{ #category : 'tests' }
GTreeListReferenceTest >> newTreeListReference [
	
	^ self newTreeListReference: { Object } children: [ :item | item subclasses ]
]

{ #category : 'tests' }
GTreeListReferenceTest >> newTreeListReference: roots children: aBlock [

	^ GTreeListReferenceContainer newRoots: roots children: aBlock
]

{ #category : 'tests' }
GTreeListReferenceTest >> testFindRootItem [
	| tree |

	tree := self newTreeListReference.
	self assert: (tree itemAt: 1) equals: Object
]

{ #category : 'tests' }
GTreeListReferenceTest >> testFindRootItemNotTheFirst [
	| tree classes streamIndex variableIndex pointIndex |

	classes := Object subclasses.
	streamIndex := classes indexOf: Stream.
	variableIndex := classes indexOf: Variable.
	pointIndex := classes indexOf: Point.
	
	tree := self newTreeListReference: classes children: [ :aClass | aClass subclasses ].
	self assert: (tree itemAt: streamIndex) equals: Stream.
	self assert: (tree itemAt: variableIndex) equals: Variable.
	self assert: (tree itemAt: pointIndex) equals: Point
]

{ #category : 'tests' }
GTreeListReferenceTest >> testPathRootItem [
	| tree |

	tree := self newTreeListReference.
	self assert: (tree itemAtPath: #(1)) equals: Object
]

{ #category : 'tests' }
GTreeListReferenceTest >> testPathSecondaryItem [
	| tree classes streamIndex variableIndex pointIndex |

	classes := Object subclasses.
	streamIndex := classes indexOf: Stream.
	variableIndex := classes indexOf: Variable.
	pointIndex := classes indexOf: Point.
	
	tree := self newTreeListReference.
	self assert: (tree itemAtPath: { 1. streamIndex }) equals: Stream.
	self assert: (tree itemAtPath: { 1. variableIndex }) equals: Variable.
	self assert: (tree itemAtPath: { 1. pointIndex }) equals: Point
]
