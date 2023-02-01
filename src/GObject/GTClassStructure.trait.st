Trait {
	#name : #GTClassStructure,
	#category : #'GObject-ClassBuilder'
}

{ #category : #'accessing - properties' }
GTClassStructure >> gInstallPropertyId: property_id spec: pspec [

	^ self 
		ffiCall: #(void g_object_class_install_property (
  			self,
  			guint property_id,
  			"GParamSpec* "GObject *pspec))
		module: GObjectLibrary
]

{ #category : #'accessing - properties' }
GTClassStructure >> gParamSpecBooleanName: name nick: nick blurb: blurb default: default flags: flags [

	^ self 
		ffiCall: #("GParamSpec *"GObject *g_param_spec_boolean (
			const gchar* name,
  			const gchar* nick,
  			const gchar* blurb,
  			gboolean default,
  			GParamFlags flags))
		module: GObjectLibrary
]

{ #category : #'accessing - properties' }
GTClassStructure >> gParamSpecBoxedName: name nick: nick blurb: blurb type: object_type flags: flags [

	^ self 
		ffiCall: #("GParamSpec *"GObject *g_param_spec_boxed (
			const gchar* name,
  			const gchar* nick,
  			const gchar* blurb,
  			GType object_type,
  			GParamFlags flags))
		module: GObjectLibrary
]

{ #category : #'accessing - properties' }
GTClassStructure >> gParamSpecFloatName: name nick: nick blurb: blurb minimum: minimum maximum: maximum default: default_value flags: flags [

	^ self 
		ffiCall: #("GParamSpec *"GObject *g_param_spec_float (
  			const gchar* name,
  			const gchar* nick,
  			const gchar* blurb,
  			gfloat minimum,
  			gfloat maximum,
  			gfloat default_value,
  			GParamFlags flags))
		module: GObjectLibrary
]

{ #category : #'accessing - properties' }
GTClassStructure >> gParamSpecIntName: name nick: nick blurb: blurb minimum: minimum maximum: maximum default: default_value flags: flags [

	^ self
		ffiCall: #("GParamSpec *"GObject *g_param_spec_int (
  			const gchar* name,
  			const gchar* nick,
  			const gchar* blurb,
  			gint minimum,
  			gint maximum,
  			gint default_value,
  			GParamFlags flags))
		module: GObjectLibrary
]

{ #category : #'accessing - properties' }
GTClassStructure >> gParamSpecLongName: name nick: nick blurb: blurb minimum: minimum maximum: maximum default: default_value flags: flags [

	^ self
		ffiCall: #("GParamSpec *"GObject *g_param_spec_long (
  			const gchar* name,
  			const gchar* nick,
  			const gchar* blurb,
  			glong minimum,
  			glong maximum,
  			glong default_value,
  			GParamFlags flags))
		module: GtkLibrary
]

{ #category : #'accessing - properties' }
GTClassStructure >> gParamSpecStringName: name nick: nick blurb: blurb default: default flags: flags [

	^ self 
		ffiCall: #("GParamSpec *"GObject *g_param_spec_string (
			const gchar* name,
  			const gchar* nick,
  			const gchar* blurb,
  			const gchar* default,
  			GParamFlags flags))
		module: GObjectLibrary
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyBooleanId: index name: aName default: default flags: flags [

	self 
		installPropertyBooleanId: index 
		name: aName 
		nick: aName 
		blurb: aName 
		default: default 
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyBooleanId: index name: aName nick: aNickname blurb: aBlurb default: default flags: flags [

	self 
		gInstallPropertyId: index 
		spec: (self 
			gParamSpecBooleanName: aName 
			nick: aNickname 
			blurb: aBlurb 
			default: default 
			flags: flags)
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyFloatId: index name: aName default: default flags: flags [

	self 
		installPropertyFloatId: index 
		name: aName 
		nick: aName
		blurb: aName
		minimum: Float fmin 
		maximum: Float fmax
		default: default 
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyFloatId: index name: aName minimum: minimum maximum: maximum default: default flags: flags [

	self 
		installPropertyFloatId: index 
		name: aName 
		nick: aName
		blurb: aName
		minimum: minimum
		maximum: maximum
		default: default 
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyFloatId: index name: aName nick: aNickname blurb: aBlurb minimum: minimum maximum: maximum default: default flags: flags [

	self 
		gInstallPropertyId: index 
		spec: (self 
			gParamSpecFloatName: aName 
			nick: aNickname 
			blurb: aBlurb
			minimum: minimum 
			maximum: maximum 
			default: default 
			flags: flags)
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyIntId: index name: aName default: default flags: flags [

	self
		installPropertyIntId: index
		name: aName
		nick: aName
		blurb: aName
		minimum: 0
		maximum: 16rFFFF
		default: default
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyIntId: index name: aName minimum: minimum maximum: maximum default: default flags: flags [

	self 
		installPropertyIntId: index 
		name: aName 
		nick: aName
		blurb: aName
		minimum: minimum 
		maximum: maximum
		default: default 
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyIntId: index name: aName nick: aNickname blurb: aBlurb minimum: minimum maximum: maximum default: default flags: flags [

	self 
		gInstallPropertyId: index 
		spec: (self 
			gParamSpecIntName: aName 
			nick: aNickname 
			blurb: aBlurb
			minimum: minimum 
			maximum: maximum 
			default: default 
			flags: flags)
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyLongId: index name: aName default: default flags: flags [

	self
		installPropertyLongId: index
		name: aName
		nick: aName
		blurb: aName
		minimum: 0
		maximum: 16rFFFFFFFF
		default: default
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyLongId: index name: aName minimum: minimum maximum: maximum default: default flags: flags [

	self
		installPropertyLongId: index
		name: aName
		nick: aName
		blurb: aName
		minimum: minimum
		maximum: maximum
		default: default
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyLongId: index name: aName nick: aNickname blurb: aBlurb minimum: minimum maximum: maximum default: default flags: flags [

	self
		gInstallPropertyId: index
		spec: (self
			gParamSpecLongName: aName
			nick: aNickname
			blurb: aBlurb
			minimum: minimum
			maximum: maximum
			default: default
			flags: flags)
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyObjectId: index name: aName nick: aNickname blurb: aBlurb type: aGType flags: flags [

	self 
		gInstallPropertyId: index 
		spec: (self 
			gParamSpecBoxedName: aName 
			nick: aNickname 
			blurb: aBlurb 
			type: aGType 
			flags: flags)
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyStringId: index name: aName default: default flags: flags [

	self 
		installPropertyStringId: index 
		name: aName 
		nick: aName
		blurb: aName 
		default: default 
		flags: flags
]

{ #category : #'accessing - properties' }
GTClassStructure >> installPropertyStringId: index name: aName nick: aNickname blurb: aBlurb default: default flags: flags [

	self 
		gInstallPropertyId: index 
		spec: (self 
			gParamSpecStringName: aName 
			nick: aNickname 
			blurb: aBlurb 
			default: default 
			flags: flags)
]
