Class {
	#name : #GtkCellRendererCustom,
	#superclass : #GtkCellRenderer,
	#instVars : [
		'padding'
	],
	#pools : [
		'GtkCellRendererMode'
	],
	#classInstVars : [
		'gtkCellRendererStructure'
	],
	#category : #'Gtk-Widget-CellRenderers'
}

{ #category : #private }
GtkCellRendererCustom class >> cellRendererNew [

	self error: 'Should not arrive here'
]

{ #category : #accessing }
GtkCellRendererCustom class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GtkCellRendererCustom class >> gDefine: gClass [

	gClass 
		parent: GtkCellRenderer;
		classInitialize: [ :gClassHandle |
			self gInitializeClass: (GtkCellRendererClass fromHandle: gClassHandle) ]
]

{ #category : #'class initialization' }
GtkCellRendererCustom class >> gInitializeClass: aDefinition [

	gtkCellRendererStructure:= aDefinition.
	self gInitializeClassSetProperty: aDefinition.
	self gInitializeClassGetProperty: aDefinition.
	self gInitializeClassRender: aDefinition.
	self gInitializeClassInstallPropertiesOn: aDefinition
]

{ #category : #'class initialization' }
GtkCellRendererCustom class >> gInitializeClassGetProperty: aDefinition [
		
	aDefinition parent_class get_property: (GCallback 
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
GtkCellRendererCustom class >> gInitializeClassGetSize: aDefinition [
	"not used for the moment"

	 aDefinition get_size: (GCallback 
			signature: #(void (
				"GtkCellRenderer            *"void *cell,
				"GtkWidget                  *"void *widget,
				"const GdkRectangle         *"void *rectangle,
				"gint                       *"void *x_offset,
				"gint                       *"void *y_offset,
				"gint                       *"void *width,
				"gint                       *"void *height) )
			block: [ :cell :widget :rect :xOff :yOff :width :height | 
				(self gInstance: cell) 
					getSize: widget 
					rectangle: (GdkRectangle fromHandle: rect) 
					xOffset: xOff 
					yOffset: yOff 
					width: width 
					height: height ])
]

{ #category : #'class initialization' }
GtkCellRendererCustom class >> gInitializeClassInstallPropertiesOn: aDefinition [
	"override to add custom properties"
]

{ #category : #'class initialization' }
GtkCellRendererCustom class >> gInitializeClassRender: aDefinition [

	aDefinition render: (GCallback 
		signature: #(void (
			"GtkCellRenderer            *"void *cell,
			"cairo_t                    *"void *cr,
			"GtkWidget                  *"void *widget,
			"const GdkRectangle         *"void *background_area,
			"const GdkRectangle         *"void *cell_area,
			"GtkCellRendererState        "int flags))
		block: [ :cell :cr : widget :bgArea :cellArea :flags |
			(self gInstance: cell) 
				renderCr: cr 
				widget: (GtkWidget fromHandle: widget)
				backgroundArea: (GdkRectangle fromHandle: bgArea)
				cellArea: (GdkRectangle fromHandle: cellArea)
				flags: flags ])
]

{ #category : #'class initialization' }
GtkCellRendererCustom class >> gInitializeClassSetProperty: aDefinition [

	aDefinition parent_class set_property: (GCallback 
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

{ #category : #'class initialization' }
GtkCellRendererCustom class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #private }
GtkCellRendererCustom class >> gtkBooleanCellAccessibleGetType [

	^ self ffiCall: #(gsize #gtk_boolean_cell_accessible_get_type())
]

{ #category : #'instance creation' }
GtkCellRendererCustom class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #'accessing - geometry' }
GtkCellRendererCustom >> getPreferredWidth: widget minimum: minimumSize natural: naturalSize [
	"override this to calculate width and set them in buffers"
]

{ #category : #'accessing - properties' }
GtkCellRendererCustom >> getProperty: id inValue: gValue [
	"override this to get a property value"
]

{ #category : #'accessing - geometry' }
GtkCellRendererCustom >> getSize: widget 
	rectangle: rect 
	xOffset: xOffsetBuffer 
	yOffset: yOffsetBuffer 
	width: widthBuffer 
	height: heightBuffer [
	"override this to calculate size and set them in buffers"
]

{ #category : #accessing }
GtkCellRendererCustom >> mode: aGtkCellRendererMode [

	self 
		gObjectSet: 'mode' 
		toInteger: aGtkCellRendererMode value
]

{ #category : #accessing }
GtkCellRendererCustom >> padding [

	^ padding ifNil: [ padding := super padding ]
]

{ #category : #accessing }
GtkCellRendererCustom >> padding: aPoint [

	padding := nil.
	super padding: aPoint
]

{ #category : #rendering }
GtkCellRendererCustom >> renderCr: cr widget: widget backgroundArea: bgRect cellArea: cellRect flags: flags [
	"override this to draw your custom cell"
]

{ #category : #'accessing - properties' }
GtkCellRendererCustom >> setProperty: id toValue: gValue [
	"override this to set your property value"
]
