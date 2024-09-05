"
Flags used to define the behaviour of a GApplication.

https://docs.gtk.org/gio/flags.ApplicationFlags.html
"
Class {
	#name : 'GApplicationFlags',
	#superclass : 'GEnumeration',
	#classVars : [
		'G_APPLICATION_ALLOW_REPLACEMENT',
		'G_APPLICATION_CAN_OVERRIDE_APP_ID',
		'G_APPLICATION_DEFAULT_FLAGS',
		'G_APPLICATION_HANDLES_COMMAND_LINE',
		'G_APPLICATION_HANDLES_OPEN',
		'G_APPLICATION_IS_LAUNCHER',
		'G_APPLICATION_IS_SERVICE',
		'G_APPLICATION_NON_UNIQUE',
		'G_APPLICATION_REPLACE',
		'G_APPLICATION_SEND_ENVIRONMENT'
	],
	#category : 'Gdk-Application',
	#package : 'Gdk',
	#tag : 'Application'
}

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_ALLOW_REPLACEMENT [
	"This method was automatically generated"
	^ G_APPLICATION_ALLOW_REPLACEMENT
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_CAN_OVERRIDE_APP_ID [
	"This method was automatically generated"
	^ G_APPLICATION_CAN_OVERRIDE_APP_ID
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_DEFAULT_FLAGS [
	"This method was automatically generated"
	^ G_APPLICATION_DEFAULT_FLAGS
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_HANDLES_COMMAND_LINE [
	"This method was automatically generated"
	^ G_APPLICATION_HANDLES_COMMAND_LINE
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_HANDLES_OPEN [
	"This method was automatically generated"
	^ G_APPLICATION_HANDLES_OPEN
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_IS_LAUNCHER [
	"This method was automatically generated"
	^ G_APPLICATION_IS_LAUNCHER
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_IS_SERVICE [
	"This method was automatically generated"
	^ G_APPLICATION_IS_SERVICE
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_NON_UNIQUE [
	"This method was automatically generated"
	^ G_APPLICATION_NON_UNIQUE
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_REPLACE [
	"This method was automatically generated"
	^ G_APPLICATION_REPLACE
]

{ #category : 'accessing enum' }
GApplicationFlags class >> G_APPLICATION_SEND_ENVIRONMENT [
	"This method was automatically generated"
	^ G_APPLICATION_SEND_ENVIRONMENT
]

{ #category : 'enum declaration' }
GApplicationFlags class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"

	^ {  
  #G_APPLICATION_DEFAULT_FLAGS. 			0.
  #G_APPLICATION_IS_SERVICE.          	(1 << 0).
  #G_APPLICATION_IS_LAUNCHER.          	(1 << 1).
  #G_APPLICATION_HANDLES_OPEN.         	(1 << 2).
  #G_APPLICATION_HANDLES_COMMAND_LINE.	(1 << 3).
  #G_APPLICATION_SEND_ENVIRONMENT. 		(1 << 4).
  #G_APPLICATION_NON_UNIQUE. 				(1 << 5).
  #G_APPLICATION_CAN_OVERRIDE_APP_ID. 	(1 << 6).
  #G_APPLICATION_ALLOW_REPLACEMENT. 		(1 << 7).
  #G_APPLICATION_REPLACE. 					(1 << 8)
	}
]
