"
Adds class methods needed to define a class in gtk side.

"
Trait {
	#name : 'GTClass',
	#category : 'GObject-ClassBuilder',
	#package : 'GObject',
	#tag : 'ClassBuilder'
}

{ #category : 'class initialization' }
GTClass classSide >> gClass [

	^ GClass gClassAt: self
]

{ #category : 'class initialization' }
GTClass classSide >> gDefine: gClass [

	gClass parent: self superclass
]

{ #category : 'class initialization' }
GTClass classSide >> gInstall [

	"forces install"
	GClass gDefinitionAt: self
]

{ #category : 'class initialization' }
GTClass classSide >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : 'class initialization' }
GTClass classSide >> gInstanceSafe: handle [

	^ self gClass safeFindInstance: handle
]

{ #category : 'accessing' }
GTClass classSide >> gType [

	^ (GClass gDefinitionAt: self) type
]

{ #category : 'instance creation' }
GTClass classSide >> new [

	^ (GClass gDefinitionAt: self) new
]
