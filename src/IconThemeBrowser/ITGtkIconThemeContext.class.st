Class {
	#name : #ITGtkIconThemeContext,
	#superclass : #ITGtkIconThemeNode,
	#category : #IconThemeBrowser
}

{ #category : #accessing }
ITGtkIconThemeContext class >> all [

	^ GtkIconTheme default allContextNames sorted 
		collect: [ :each | self newName: each ]
]

{ #category : #accessing }
ITGtkIconThemeContext >> children [

	^ (GtkIconTheme default namesInContext: self name) sorted
		collect: [ :each | ITGtkIconThemeIcon newName: each ]
]
