"
A GtkFileDialog object collects the arguments that are needed to present a file chooser dialog to the user, such as a title for the dialog and whether it should be modal.

https://docs.gtk.org/gtk4/class.FileDialog.html
"
Class {
	#name : 'GtkFileDialog',
	#superclass : 'GtkStandardDialog',
	#instVars : [
		'parent',
		'callback',
		'filters'
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

{ #category : 'accessing' }
GtkFileDialog >> filters: aGListModel [

	filters := aGListModel.
	self setFilters: aGListModel.
	filters objectUnrefNow
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
		aBlock value: (file isNull 
			ifTrue: [ nil ] 
			ifFalse: [ file ]) ].
		
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
		aBlock value: (file isNull 
			ifTrue: [ nil ] 
			ifFalse: [ file ]) ].
		
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

{ #category : 'actions' }
GtkFileDialog >> selectFolderDo: aBlock [

	callback := self newCallback: [ :source :result :user_data |
		| file |
		file := self selectFolderFinishResult: result.
		aBlock value: (file isNull 
			ifTrue: [ nil ] 
			ifFalse: [ file ]) ].
		
	self 
		selectParent: parent
		cancellable: GObject null 
		callback: callback
]

{ #category : 'private' }
GtkFileDialog >> selectFolderFinishResult: result [

	self ffiCall: #(GFile* gtk_file_dialog_select_folder_finish (
  		self,
  		"GAsyncResult*"void *result,
  		NULL))
]

{ #category : 'private' }
GtkFileDialog >> selectParent: aParent cancellable: cancellable callback: aCallback [

	self ffiCall: #(void gtk_file_dialog_select_folder (
  	self,
  	GtkWindow* aParent,
  	"GCancellable*"void* cancellable,
  	"GAsyncReadyCallback"GCallback aCallback,
  	NULL))
]

{ #category : 'private' }
GtkFileDialog >> setFilters: filterListModel [

	self ffiCall: #(void gtk_file_dialog_set_filters (self, GListModel* filterListModel))
]

{ #category : 'accessing' }
GtkFileDialog >> title [

	self ffiCall: #(char* gtk_file_dialog_get_title (self))
	
]

{ #category : 'accessing' }
GtkFileDialog >> title: title [

	self ffiCall: #(void gtk_file_dialog_set_title (self, const char* title))

	
]
