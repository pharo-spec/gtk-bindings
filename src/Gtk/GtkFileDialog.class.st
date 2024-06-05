"
A GtkFileDialog object collects the arguments that are needed to present a file chooser dialog to the user, such as a title for the dialog and whether it should be modal.

https://docs.gtk.org/gtk4/class.FileDialog.html
"
Class {
	#name : 'GtkFileDialog',
	#superclass : 'GtkStandardDialog',
	#instVars : [
		'parent',
		'callback'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'examples' }
GtkFileDialog class >> exampleOpen [

	GEngine ensureRunning.
	GRunLoop defer: [ 
		GtkFileDialog new open ]
]

{ #category : 'examples' }
GtkFileDialog class >> exampleSave [

	GEngine ensureRunning.
	GRunLoop defer: [ 
		GtkFileDialog new save ]
]

{ #category : 'private' }
GtkFileDialog class >> gtkNew [

	^ self ffiCall: #(GtkFileDialog *gtk_file_dialog_new (void))
]

{ #category : 'instance creation' }
GtkFileDialog class >> new [

	^ self gtkNew initialize
]

{ #category : 'accessing - building' }
GtkFileDialog >> callback: aCallback [
	
	callback := aCallback
]

{ #category : 'actions' }
GtkFileDialog >> open [

	self 
		openParent: (parent ifNil: [ GObject null ])
		cancellable: GObject null 
		callback: (callback ifNil: [ GCallback null ])
]

{ #category : 'private' }
GtkFileDialog >> openParent: aParent cancellable: cancellable callback: aCallback [

	self ffiCall: #(void gtk_file_dialog_open (
  	self,
  	GtkWindow* aParent,
  	"GCancellable*"void* cancellable,
  	"GAsyncReadyCallback"GCallback aCallback,
  	NULL))

]

{ #category : 'accessing - building' }
GtkFileDialog >> parent: aParent [
	
	parent := aParent
]

{ #category : 'actions' }
GtkFileDialog >> save [

	self 
		saveParent: (parent ifNil: [ GObject null ])
		cancellable: GObject null 
		callback: (callback ifNil: [ GCallback null ])
]

{ #category : 'private' }
GtkFileDialog >> saveParent: aParent cancellable: aCancellable callback: aCallback [

	self ffiCall: #(void gtk_file_dialog_save (
  		self,
  		GtkWindow* aParent,
  		"GCancellable"void* aCancellable,
  		"GAsyncReadyCallback"GCallback aCallback,
  		NULL))

]
