"
https://docs.gtk.org/gtk4/class.ColorDialog.html
"
Class {
	#name : 'GtkColorDialog',
	#superclass : 'GtkStandardDialog',
	#instVars : [
		'callback',
		'parent',
		'initialColorRGBA'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'utils' }
GtkColorDialog class >> chooseColorParent: aWindow title: aTitle initial: aColor [
	| dialog result sem |

	GRunLoop current isInCallback 
		ifTrue: [ self error: 'I can''t execute modally inside a callback, go out and retry.' ].

	sem := Semaphore new.
	[
		GRunLoop defer: [ 
			dialog := self new.
			dialog modal: true. 
			dialog title: aTitle.
			aColor ifNotNil: [ 
				dialog initialColor: aColor ].
			dialog parent: aWindow.

			dialog chooseRGBADo: [ :aColorRGBA |
				result := aColorRGBA asColor.
				sem signal ] 
		]
	] fork.	
	
	sem wait.

	^ result
]

{ #category : 'examples' }
GtkColorDialog class >> exampleChooseRGBA [

	GEngine ensureRunning.
	GRunLoop defer: [ 
		GtkColorDialog new 
			title: 'Test';
			chooseRGBADo: [ :rgba | rgba inspect ] ]
]

{ #category : 'private' }
GtkColorDialog class >> gtkNew [

	^ self ffiCall: #(GtkColorDialog* gtk_color_dialog_new (void))
]

{ #category : 'instance creation' }
GtkColorDialog class >> new [

	^ self gtkNew initialize
]

{ #category : 'actions' }
GtkColorDialog >> chooseRGBADo: aBlock [
	
	callback := self newCallback: [ :source :result :user_data |
		| rgba |
		rgba := self chooseRGBAFinish: result.
		[
			aBlock value: (rgba isNull 
				ifTrue: [ nil ] 
				ifFalse: [ rgba ])
		] fork ].
		
	self 
		chooseRGBAParent: (parent ifNil: [ GObject null ])
		color: (initialColorRGBA ifNil: [ GdkRGBA new ])
		callback: callback.
	
	"I need to release it, to let the system collect it when finished"
	self objectUnrefNow
]

{ #category : 'private' }
GtkColorDialog >> chooseRGBAFinish: result [

	self ffiCall: #(GdkRGBA* gtk_color_dialog_choose_rgba_finish (
  		self,
  		"GAsyncResult*"void *result,
  		"GError** error"NULL))
]

{ #category : 'private' }
GtkColorDialog >> chooseRGBAParent: aParent color: initial_color callback: aCallback [

	self ffiCall: #(void gtk_color_dialog_choose_rgba (
  		self,
  		GtkWindow* aParent,
  		GdkRGBA* initial_color,
  		"GCancellable* cancellable"NULL,
  		"GAsyncReadyCallback"GCallback aCallback,
  		"gpointer user_data"NULL))
]

{ #category : 'accessing' }
GtkColorDialog >> initialColor: aColor [

	self initialColorRGBA: aColor asGdkRGBA
]

{ #category : 'accessing' }
GtkColorDialog >> initialColorRGBA: aRGBA [

	initialColorRGBA := aRGBA
]

{ #category : 'accessing' }
GtkColorDialog >> modal: modal [

	self ffiCall: #(void gtk_color_dialog_set_modal (self, gboolean modal))
]

{ #category : 'accessing' }
GtkColorDialog >> parent: aParent [

	parent := aParent
]

{ #category : 'accessing' }
GtkColorDialog >> title: title [

	self ffiCall: #(void gtk_color_dialog_set_title (self, const char* title))
]

{ #category : 'accessing' }
GtkColorDialog >> withAlpha: with_alpha [
	
	self ffiCall: #(void gtk_color_dialog_set_with_alpha (self, gboolean with_alpha))
]
