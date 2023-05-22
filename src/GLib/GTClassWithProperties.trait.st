"
Adds class methods needed to define a class in gtk side.
The class will contain also properties (accessible also on gtk side).
"
Trait {
	#name : #GTClassWithProperties,
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#category : #'GLib-Lists'
}

{ #category : #'class initialization' }
GTClassWithProperties classSide >> gClassDefinition [

	^ GObjectClass
]

{ #category : #'class initialization' }
GTClassWithProperties classSide >> gDefine: gClass [

	gClass 
		parent: self superclass;
		classInitialize: [ :gClassHandle |
			self gInitializeClass: (self gClassDefinition fromHandle: gClassHandle) ]
]

{ #category : #'class initialization' }
GTClassWithProperties classSide >> gInitializeClass: aDefinition [
		
	self gInitializeClassSetProperty: aDefinition gObjectClass.
	self gInitializeClassGetProperty: aDefinition gObjectClass.
	self gInitializeClassInstallPropertiesOn: aDefinition 
]

{ #category : #'class initialization' }
GTClassWithProperties classSide >> gInitializeClassGetProperty: aDefinition [
		
	aDefinition get_property: (GCallback 
		signature: #(void (
			"GObject 	*"void *object,
			guint 		property_id,
			"const GValue   *"void *value,
			"GParamSpec     *"void *pspec)) 
		block: [ :object :id :value :pspec | 
			(self gInstance: object) 
				getProperty: id 
				inValue: (GValue fromHandle: value) ])
]

{ #category : #'class initialization' }
GTClassWithProperties classSide >> gInitializeClassInstallPropertiesOn: aDefinition [ 
]

{ #category : #'class initialization' }
GTClassWithProperties classSide >> gInitializeClassSetProperty: aGObjectClass [

	aGObjectClass set_property: (GCallback 
		signature: #(void (
			"GObject 	*"void *object,
			guint 		property_id,
			"const GValue   *"void *value,
			"GParamSpec     *"void *pspec)) 
		block: [ :object :id :value :pspec | 
			(self gInstance: object) 
				setProperty: id 
				toValue: (GValue fromHandle: value) ])
]

{ #category : #'accessing - properties' }
GTClassWithProperties >> getProperty: id inValue: gValue [
	"override this to get a property value"
]

{ #category : #'accessing - properties' }
GTClassWithProperties >> setProperty: id toValue: gValue [
	"override this to set your property value"
]
