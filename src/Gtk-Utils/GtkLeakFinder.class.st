"
A simple tool to match create/destroy of Gtk widgets.

# Usage

```Smalltalk
| finder|

finder := GtkLeakFinder new.
finder start.
""do your stuff""
Smalltalk garbageCollect.
finder stop.
finder leaks inspect. ""this will show collected leaks""
```
(alternatively you can inspect finder, it has a ""leaks"" tab to show results).

## Notes

- Use `reset`:  to clean up your collected stuff and start over

"
Class {
	#name : 'GtkLeakFinder',
	#superclass : 'SignalLogger',
	#instVars : [
		'created',
		'destroyed',
		'mutex',
		'zombies'
	],
	#category : 'Gtk-Utils',
	#package : 'Gtk-Utils'
}

{ #category : 'initialization' }
GtkLeakFinder class >> reset [
	<script>

	self instance reset
]

{ #category : 'accessing' }
GtkLeakFinder class >> startTraceLeaks [
	<script>

	GSignalBaseAnnouncement filterAllSignalsExcept: { 
		GCreateAnnouncement. 
		GDestroyAnnouncement. 
		GFinalizeAnnouncement }. 
	self start. 
	self instance inspect
]

{ #category : 'accessing' }
GtkLeakFinder class >> stopTraceLeaks [
	<script>

	GSignalBaseAnnouncement resetFilters.
	self stop
]

{ #category : 'accessing - actions' }
GtkLeakFinder >> cleanUp [

	3 timesRepeat: [ GRunLoop forceDefer: [] ].
	3 timesRepeat: [ Smalltalk garbageCollect ].

]

{ #category : 'accessing' }
GtkLeakFinder >> collected [

	^ created \ (self leaks)
]

{ #category : 'accessing' }
GtkLeakFinder >> collectedWithInstancesCount [

	^ (self collected collect: [ :each | each -> (each instanceCount) ]) asDictionary
]

{ #category : 'accessing - actions' }
GtkLeakFinder >> destroyed [

	self cleanUp.
	^ created select: [ :each | destroyed includes: each handle ]
]

{ #category : 'private' }
GtkLeakFinder >> ensureLoggingSignals [
	
	self signals do: [ :each | each traceSignal ]
]

{ #category : 'initialization' }
GtkLeakFinder >> initialize [

	super initialize.
	mutex := Mutex new.
	self reset
]

{ #category : 'inspecting' }
GtkLeakFinder >> inspectorLeaks: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Leaks'>
	| table |

	^ (table := aBuilder newTable)
		addColumn: (SpStringTableColumn title: 'Widget' evaluated: [ :assoc | assoc key asString ]);
		addColumn: (SpStringTableColumn title: 'References' evaluated: [ :assoc | assoc value ]);
		items: self leaksWithReferenceCount;
		contextMenu: (SpMenuPresenter new 
			addItem: [ :item | item 
				name: 'Explore pointers'; 
				action: [ StInspectorPresenter inspect: table selectedItem findAllPaths ] ];
			yourself);
		yourself
]

{ #category : 'accessing - actions' }
GtkLeakFinder >> leaks [

	self cleanUp.
	^ created reject: [ :each | destroyed includes: each handle ]
]

{ #category : 'accessing' }
GtkLeakFinder >> leaksWithInstancesCount [

	^ (self leaks collect: [ :each | each -> (each instanceCount) ]) asDictionary
]

{ #category : 'accessing' }
GtkLeakFinder >> leaksWithReferenceCount [

	^ (self leaks collect: [ :each | each -> (each referenceCount) ]) asDictionary
]

{ #category : 'registering' }
GtkLeakFinder >> logCreateSignal: aSignal [

	mutex critical: [ 
		created add: (GtkWidgetTrace new 
			widgetClass: aSignal widget class;
			handle: aSignal widget getHandle copy;
			yourself) ]
]

{ #category : 'registering' }
GtkLeakFinder >> logDestroySignal: aSignal [

	mutex critical: [ 
		destroyed add: aSignal handle copy ]
]

{ #category : 'registering' }
GtkLeakFinder >> logZombieSignal: aSignal [

	mutex critical: [ 
		zombies add: (GtkWidgetTrace new 
			widgetClass: aSignal target;
			handle: aSignal handle copy;
			yourself) ]
]

{ #category : 'registering' }
GtkLeakFinder >> nextPut: aSignal [

	(aSignal respondsTo: #logIn:) ifFalse: [ ^ self ].
	aSignal logIn: self
]

{ #category : 'accessing - actions' }
GtkLeakFinder >> remainingReferences [
	<script: 'self new remainingReferences inspect'>
	
	self cleanUp.
	^ (Smalltalk allClasses
		select: [ :each | 
			(each name beginsWith: 'Gtk') 
				and: [ each canUnderstand: #getHandle ] ]
		thenCollect: [ :eachClass | 
			eachClass allInstances 
				reject: [ :each | each getHandle isNull ]
				thenCollect: [ :each | 
					GtkWidgetTrace new 
						widgetClass: eachClass;
						handle: each getHandle;
						yourself ] ])
		flattened
]

{ #category : 'initialization' }
GtkLeakFinder >> reset [
	
	created := Set new.
	destroyed := Set new.
	zombies := Set new
]

{ #category : 'private' }
GtkLeakFinder >> signals [

	^ { GCreateAnnouncement. GDestroyAnnouncement. GZombieAnnouncement }
]

{ #category : 'registering' }
GtkLeakFinder >> start [

	self ensureLoggingSignals.
	self startFor: GSignalBaseAnnouncement
]

{ #category : 'registering' }
GtkLeakFinder >> stop [
	
	3 timesRepeat: [ Smalltalk garbageCollect ].
	super stop.
	GSignalBaseAnnouncement resetFilters
]

{ #category : 'accessing - actions' }
GtkLeakFinder >> zombies [

	3 timesRepeat: [ Smalltalk garbageCollect ].
	^ zombies
]
