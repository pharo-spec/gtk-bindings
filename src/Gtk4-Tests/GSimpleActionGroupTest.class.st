Class {
	#name : #GSimpleActionGroupTest,
	#superclass : #GtkBaseTest,
	#category : #'Gtk4-Tests-Base'
}

{ #category : #tests }
GSimpleActionGroupTest >> testInsert [
	| group action1 |

	group := GSimpleActionGroup new.
	action1 := GSimpleAction newName: 'test1'.
	group insert: action1.
	
	self assert: (group lookup: 'test1') equals: action1
]

{ #category : #tests }
GSimpleActionGroupTest >> testRemove [
	| group action1 |

	group := GSimpleActionGroup new.
	action1 := GSimpleAction newName: 'test1'.
	group insert: action1.
	
	group remove: action1.
	
	self assert: (group lookup: 'test1') isNil
]

{ #category : #tests }
GSimpleActionGroupTest >> testRemoveNamed [
	| group action1 |

	group := GSimpleActionGroup new.
	action1 := GSimpleAction newName: 'test1'.
	group insert: action1.
	
	group removeNamed: 'test1'.
	
	self assert: (group lookup: 'test1') isNil

]
