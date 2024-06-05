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
		GtkFileDialog new 
			openDo: [ :file | file inspect ] ].
	
	
]

{ #category : 'examples' }
GtkFileDialog class >> exampleOpenModal [
	| sem result |

	GEngine ensureRunning.
	
	sem := Semaphore new.
	GRunLoop defer: [ 
		GtkFileDialog new openDo: [ :file | 
			result := file.
			sem signal ] ].
	sem wait.
	result inspect
]

{ #category : 'examples' }
GtkFileDialog class >> exampleSave [

	GEngine ensureRunning.
	GRunLoop defer: [ 
		GtkFileDialog new saveDo: [ :file | file inspect ] ]
]

{ #category : 'private' }
GtkFileDialog class >> gtkNew [

	^ self ffiCall: #(GtkFileDialog *gtk_file_dialog_new (void))
]

{ #category : 'instance creation' }
GtkFileDialog class >> new [

	^ self gtkNew initialize
]

{ #category : 'initialization' }
GtkFileDialog >> initialize [

	super initialize.
	parent := GObject null
]

{ #category : 'private' }
GtkFileDialog >> newCallback: aBlock [
"GAsyncReadyCallback
	void
(* GAsyncReadyCallback) (
  GObject* source_object,
  GAsyncResult* res,
  gpointer data
)"

	^ GCallback 
		signature: #(void (void *source, void *result, gpointer user_data)) 
		block: aBlock
]

{ #category : 'actions' }
GtkFileDialog >> openDo: aBlock [

	callback := self newCallback: [ :source :result :user_data |
		| file |
		file := self openFinishResult: result.
		aBlock value: file ].
		
	self 
		openParent: parent
		cancellable: GObject null 
		callback: callback
]

{ #category : 'private' }
GtkFileDialog >> openFinishResult: result [

	self ffiCall: #(GFile* gtk_file_dialog_open_finish (
  		self,
  		"GAsyncResult*"void *result,
  		NULL))
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
GtkFileDialog >> saveDo: aBlock [

	callback := self newCallback: [ :source :result :user_data |
		| file |
		file := self saveFinishResult: result.
		aBlock value: file ].
		
	self 
		saveParent: parent
		cancellable: GObject null 
		callback: callback
]

{ #category : 'private' }
GtkFileDialog >> saveFinishResult: result [

	self ffiCall: #(GFile* gtk_file_dialog_save_finish (
  		self,
  		"GAsyncResult*"void *result,
  		NULL))
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
