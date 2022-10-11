Trait {
	#name : #GTClass,
	#category : #'GLib-Lists'
}

{ #category : #'class initialization' }
GTClass classSide >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GTClass classSide >> gDefine: gClass [

	gClass parent: self superclass
]

{ #category : #'class initialization' }
GTClass classSide >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #'class initialization' }
GTClass classSide >> gInstanceSafe: handle [

	^ self gClass safeFindInstance: handle
]

{ #category : #'instance creation' }
GTClass classSide >> new [

	^ (GClass gDefinitionAt: self) new
]