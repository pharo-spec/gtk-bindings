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

{ #category : 'accessing' }
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
GtkWidgetTrace >> inspectionInfo [
	<inspectorPresentationOrder: 0 title: 'Info'>

	^ SpTablePresenter new 
		hideColumnHeaders;
		addColumn: (SpStringTableColumn evaluated: [ :assoc | assoc key ]);
		addColumn: (SpStringTableColumn evaluated: [ :assoc | assoc value ]);
		items: {  
			'Class' -> self widgetClass name.
			'Address' -> self handle printString.
			"'isAlive' -> self isAlive." "Sometimes there is a problem knowing if object is alive"
			'Instances' -> self instances size.
			'Referece Count' -> self referenceCount.
			};
		yourself
]

{ #category : 'accessing' }
GtkWidgetTrace >> instanceCount [

	^ self instances size
]

{ #category : 'accessing' }
GtkWidgetTrace >> instances [
	| stream |

	stream := Array new writeStream.
	self widgetClass allInstancesDo: [ :each |
		(each getHandle = handle) ifTrue: [ 
			stream nextPut: each ] ].
	
	^ stream contents
]

{ #category : 'accessing' }
GtkWidgetTrace >> isAlive [

	^ GRunLoop defer: [ (GObject fromHandle: self handle) isAlive ]
]

{ #category : 'printing' }
GtkWidgetTrace >> printOn: stream [ 

	stream << self widgetClass name << '(' << self handle printString << ')'
]

{ #category : 'accessing' }
GtkWidgetTrace >> referenceCount [

	^ GRunLoop defer: [ (GObject fromHandle: self handle) referenceCount ]
]

{ #category : 'accessing' }
GtkWidgetTrace >> widgetClass [
	^ widgetClass
]

{ #category : 'accessing' }
GtkWidgetTrace >> widgetClass: anObject [
	widgetClass := anObject
]
