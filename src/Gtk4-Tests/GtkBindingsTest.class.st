Class {
	#name : #GtkBindingsTest,
	#superclass : #TestCase,
	#category : #'Gtk4-Tests-Base'
}

{ #category : #tests }
GtkBindingsTest >> testAllFFICallsAreExistingFunctions [
	"Verify all implemented functions actually exists (some functions/classes may not exist 
	 anymore from gtk3 to gtk4)"
	| notFound |

	notFound := OrderedCollection new.
	GObject withAllSubclasses 
		reject: [ :aClass | aClass isDeprecated ]
		thenDo: [ :aClass | 
			(aClass classSide methods, aClass instanceSide methods) do: [ :aMethod | 
				aMethod  ast sendNodes
					select: [ :each | each selector beginsWith: 'ffiCall:' ]
					thenDo: [ :each | | function |  
						function := (FFIFunctionParser new  
							requestor: aClass;
							parseNamedFunction: each arguments first value)
							functionName.
						[ ExternalAddress loadSymbol: function from: aClass ffiLibraryName ]
						on: PrimitiveFailed 
						do: [ :e | notFound add: function ] ] ] ].
		
	self assert: notFound isEmpty
]
