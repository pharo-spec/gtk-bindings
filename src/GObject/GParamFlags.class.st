"
https://docs.gtk.org/gobject/flags.ParamFlags.html

Through the GParamFlags flag values, certain aspects of parameters can be configured.
"
Class {
	#name : #GParamFlags,
	#superclass : #GEnumeration,
	#classVars : [
		'G_PARAM_EXPLICIT_NOTIFY',
		'G_PARAM_READABLE',
		'G_PARAM_READWRITE',
		'G_PARAM_WRITABLE'
	],
	#category : #'GObject-ClassBuilder'
}

{ #category : #'accessing enum' }
GParamFlags class >> G_PARAM_EXPLICIT_NOTIFY [
	"This method was automatically generated"
	^ G_PARAM_EXPLICIT_NOTIFY
]

{ #category : #'accessing enum' }
GParamFlags class >> G_PARAM_READABLE [
	"This method was automatically generated"
	^ G_PARAM_READABLE
]

{ #category : #'accessing enum' }
GParamFlags class >> G_PARAM_READWRITE [
	"This method was automatically generated"
	^ G_PARAM_READWRITE
]

{ #category : #'accessing enum' }
GParamFlags class >> G_PARAM_WRITABLE [
	"This method was automatically generated"
	^ G_PARAM_WRITABLE
]

{ #category : #'enum declaration' }
GParamFlags class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors"

	^ { 
  #G_PARAM_READABLE            . 1 << 0.
  #G_PARAM_WRITABLE            . 1 << 1.
  #G_PARAM_READWRITE           . ((1 << 0) | (1 << 1)).
  #G_PARAM_EXPLICIT_NOTIFY     . 1 << 30.
"Not using any of this, letting them out"
  "G_PARAM_CONSTRUCT	      	   . 1 << 2,
  G_PARAM_CONSTRUCT_ONLY      . 1 << 3,
  G_PARAM_LAX_VALIDATION      . 1 << 4.
  G_PARAM_STATIC_NAME	         . 1 << 5,
  G_PARAM_PRIVATE GLIB_DEPRECATED_ENUMERATOR_IN_2_26 = G_PARAM_STATIC_NAME,
  G_PARAM_STATIC_NICK	      = 1 << 6,
  G_PARAM_STATIC_BLURB	      = 1 << 7,
  /* User defined flags go here */
  G_PARAM_EXPLICIT_NOTIFY     = 1 << 30,
  /* Avoid warning with -Wpedantic for gcc6 */
  G_PARAM_DEPRECATED          = (gint)(1u << 31)	"
	 }
]
