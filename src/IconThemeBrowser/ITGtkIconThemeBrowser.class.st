Class {
	#name : #ITGtkIconThemeBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'image'
	],
	#category : #IconThemeBrowser
}

{ #category : #initialization }
ITGtkIconThemeBrowser >> initializePresenters [

	self layout: (SpPanedLayout newHorizontal
		add: (self newNotebook 
			addPageTitle: 'Contexts' provider: [ self newIconByContextTree ];
			addPageTitle: 'All' provider: [ self newAllIconsList ];
			yourself);
		add: (image := self newImage);
		yourself)
]

{ #category : #initialization }
ITGtkIconThemeBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Theme Icon Browser'
]

{ #category : #initialization }
ITGtkIconThemeBrowser >> newAllIconsList [
	| list |

	list := self newList.
	list items: ITGtkIconThemeIcon all.
	list display: [ :each | each name ].
	list transmitDo: [ :aNode | aNode withIconDo: [ :icon | self updateImage: icon ] ].

	^ list
]

{ #category : #initialization }
ITGtkIconThemeBrowser >> newIconByContextTree [
	| tree |
	
	tree := self newTree.
	tree roots: ITGtkIconThemeContext all.
	tree display: [ :aNode | aNode name ].
	tree children: [ :aNode | aNode children ]. 
	tree transmitDo: [ :aNode | aNode withIconDo: [ :icon | self updateImage: icon ] ].
	
	^ tree	
]

{ #category : #'private updating' }
ITGtkIconThemeBrowser >> updateImage: anIcon [

	image image: anIcon
]
