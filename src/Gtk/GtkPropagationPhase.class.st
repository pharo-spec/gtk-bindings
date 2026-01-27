Class {
	#name : 'GtkPropagationPhase',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_PHASE_BUBBLE',
		'GTK_PHASE_CAPTURE',
		'GTK_PHASE_NONE',
		'GTK_PHASE_TARGET'
	],
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'accessing enum' }
GtkPropagationPhase class >> GTK_PHASE_BUBBLE [
	"This method was automatically generated"
	^ GTK_PHASE_BUBBLE
]

{ #category : 'accessing enum' }
GtkPropagationPhase class >> GTK_PHASE_CAPTURE [
	"This method was automatically generated"
	^ GTK_PHASE_CAPTURE
]

{ #category : 'accessing enum' }
GtkPropagationPhase class >> GTK_PHASE_NONE [
	"This method was automatically generated"
	^ GTK_PHASE_NONE
]

{ #category : 'accessing enum' }
GtkPropagationPhase class >> GTK_PHASE_TARGET [
	"This method was automatically generated"
	^ GTK_PHASE_TARGET
]

{ #category : 'enum declaration' }
GtkPropagationPhase class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors
	"
	^ #(
 	GTK_PHASE_NONE 		0
	GTK_PHASE_CAPTURE	1
	GTK_PHASE_BUBBLE		2
	GTK_PHASE_TARGET		3
	)
]
