Class {
	#name : #ITGtkIconThemeIcon,
	#superclass : #ITGtkIconThemeNode,
	#category : #IconThemeBrowser
}

{ #category : #accessing }
ITGtkIconThemeIcon class >> all [

	^ GtkIconTheme default allNames sorted 
		collect: [ :each | self newName: each ]
]

{ #category : #accessing }
ITGtkIconThemeIcon >> withIconDo: aBlock [

	aBlock value: (GtkImage newIconForButtonNamed: self name)
]
