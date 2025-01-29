Class {
	#name : 'GtkWidgetTrace',
	#superclass : 'Object',
	#instVars : [
		'widgetClass',
		'handle'
	],
	#category : 'Gtk-Utils',
	#package : 'Gtk-Utils'
}

{ #category : 'actions' }
GtkWidgetTrace >> allInstances [

	^ Array streamContents: [ :stream  |
		self widgetClass allInstancesDo: [ :each |
			(each getHandle = handle) ifTrue: [ 
				stream nextPut: each ] ] ].
	
]

{ #category : 'actions' }
GtkWidgetTrace >> findAllPaths [
	| instance |
	
	instance := self widgetClass allInstances 
		detect: [ :each | each getHandle = self handle ]. 

	^ ReferenceFinder findAllPathsTo: instance
]

{ #category : 'accessing' }
GtkWidgetTrace >> handle [
	^ handle
]

{ #category : 'accessing' }
GtkWidgetTrace >> handle: anObject [
	handle := anObject
]

{ #category : 'inspecting' }
GtkWidgetTrace >> inspectionInfo: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Info'>

	^ aBuilder newTable 
		hideColumnHeaders;
		addColumn: (SpStringTableColumn evaluated: [ :assoc | assoc key ]);
		addColumn: (SpStringTableColumn evaluated: [ :assoc | assoc value ]);
		items: {  
			'Class' -> self widgetClass name.
			'Address' -> self handle printString.
			"'isAlive' -> self isAlive." "Sometimes there is a problem knowing if object is alive"
			'Instances' -> self allInstances size.
			'Referece Count' -> self referenceCount.
			};
		yourself
]

{ #category : 'actions' }
GtkWidgetTrace >> instanceCount [

	^ self allInstances size
]

{ #category : 'testing' }
GtkWidgetTrace >> isAlive [

	^ GRunLoop defer: [ (GObject fromHandle: self handle) isAlive ]
]

{ #category : 'printing' }
GtkWidgetTrace >> printOn: stream [ 

	stream << self widgetClass name << '(' << self handle printString << ')'
]

{ #category : 'actions' }
GtkWidgetTrace >> reference [

	^ self widgetClass fromHandleUnreferenced: self handle
]

{ #category : 'actions' }
GtkWidgetTrace >> referenceCount [

	^ self reference referenceCount
]

{ #category : 'actions' }
GtkWidgetTrace >> unref [

	GRunLoop defer: [ GObject objectUnref: self handle ]
]

{ #category : 'accessing' }
GtkWidgetTrace >> widgetClass [
	^ widgetClass
]

{ #category : 'accessing' }
GtkWidgetTrace >> widgetClass: anObject [
	widgetClass := anObject
]
