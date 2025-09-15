Class {
	#name : 'GEnumeration',
	#superclass : 'FFIEnumeration',
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'instance creation' }
GEnumeration class >> fromInteger: anIntegerValue [
	
	^ (self itemAt: anIntegerValue)
		ifNotNil: [ :theItem | self at: theItem ]
		ifNil: [ self newValue: anIntegerValue ]
]

{ #category : 'private' }
GEnumeration class >> newValue: anInteger [
	"Used for aritmetic"

	^ self basicNew 
		initialize;
		value: anInteger;
		yourself
]

{ #category : 'accessing' }
GEnumeration class >> systemIconName [

	^ #magnitude
]

{ #category : 'logical operations' }
GEnumeration >> & other [

	^ self class newValue: self value & other value
]

{ #category : 'arithmetic' }
GEnumeration >> + other [

	^ self class newValue: (self value + other value)
]

{ #category : 'arithmetic' }
GEnumeration >> - other [

	^ self class newValue: (self value - other value)
]

{ #category : 'logical operations' }
GEnumeration >> | other [

	^ self class newValue: self value | other value
]
