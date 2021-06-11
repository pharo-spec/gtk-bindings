"
I'm a base dialog.
I'm the foundation of modal behaviour, which I implement in the #run method.

Since the regular Gtk design will take over the event loop (and it will hang the image), we need to implement our own mechanism. This follows the same design as the original `gtk_dialog_run`.
"
Class {
	#name : #GtkBaseDialog,
	#superclass : #GtkWindow,
	#instVars : [
		'runContext',
		'keepAlive'
	],
	#pools : [
		'GtkResponseType'
	],
	#category : #'Gtk-Widget-Window'
}

{ #category : #accessing }
GtkBaseDialog class >> gType [ 

	^ nil
]

{ #category : #private }
GtkBaseDialog >> deferToAutoRelease [
		
	self application resourceManager
		addResource: self 
		executor: (GtkDelayedDestroyExecutor new
			handle: self getHandle;
			yourself).
	self unregister
]

{ #category : #accessing }
GtkBaseDialog >> doNotKeepAlive [
	"For a dialog, the default behavior is that it is destroyed after run. 
	 Setting this flag will instruct the dialog to destroy itself when closed."

	keepAlive := false
]

{ #category : #private }
GtkBaseDialog >> ensureRegister [

	(self application isWindowRegistered: self) ifTrue: [ ^ self ].
	self application registerWindow: self
]

{ #category : #initialization }
GtkBaseDialog >> initialize [ 

	super initialize.
	self initializeTitleBar.
	self initializeKeyBindings.
	self keepAlive
]

{ #category : #initialization }
GtkBaseDialog >> initializeKeyBindings [
	"| group |
	
	group := GtkAccelGroup new.
	self addAcceleratorGroup: group.
	self addAccelerator: 'hide' group: group shortcut: Character escape asKeyCombination"
	
]

{ #category : #initialization }
GtkBaseDialog >> initializeTitleBar [
	
	"self titleBar: (GtkHeaderBar new
		title: 'Untitled dialog';
		yourself)"
]

{ #category : #testing }
GtkBaseDialog >> isKeepAlive [

	^ keepAlive
]

{ #category : #testing }
GtkBaseDialog >> isRunning [ 

	^ runContext notNil
]

{ #category : #accessing }
GtkBaseDialog >> keepAlive [
	"For a dialog, the default behavior is that it is destroyed after run. 
	 Setting this flag will instruct the dialog NOT to destroy itself when closed. 
	 WARNING: garbagge collection will still collect the dialog"

	keepAlive := true.
	self markForAutoRelease
]

{ #category : #private }
GtkBaseDialog >> respond [ 

	self runContext resume.
	self hide.
	self isKeepAlive 
		ifTrue: [ self deferToAutoRelease ]
		ifFalse: [ self destroy ]
]

{ #category : #running }
GtkBaseDialog >> run [

	self isRunning ifTrue: [ self error: 'Dialog is already running!' ].
	
	self ensureRegister.
	runContext := GtkDialogRunContext newDialog: self.
	^ [ runContext run ]
	ensure: [ runContext := nil ]
]

{ #category : #private }
GtkBaseDialog >> runContext [

	^ runContext
]
