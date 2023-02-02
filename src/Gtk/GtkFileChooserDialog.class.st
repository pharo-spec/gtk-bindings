"
GtkFileChooserDialog — A file chooser dialog, suitable for “File/Open” or “File/Save” commands

https://developer.gnome.org/gtk3/stable/GtkFileChooserDialog.html

"
Class {
	#name : #GtkFileChooserDialog,
	#superclass : #GtkSystemDialog,
	#pools : [
		'GtkFileChooserAction',
		'GtkResponseType'
	],
	#category : #'Gtk-Widget-Window'
}

{ #category : #examples }
GtkFileChooserDialog class >> example [
	| dialog |

	GtkEngine ensureRunning.

	GtkRunLoop defer: [ 
		dialog := self 
			newOpenFileTitle: 'Export as...'
			acceptLabel: 'Export'
			cancelLabel: 'Cancel' ].
	
	[
		dialog run.
		self inform: dialog filename ]
	ensure: [
		GRunLoop defer: [ dialog objectUnref ] ]
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenDirectoryTitle: aString [

	^ self newOpenDirectoryTitle: aString acceptLabel: 'Open' cancelLabel: 'Cancel' 
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenDirectoryTitle: aString acceptLabel: acceptString cancelLabel: cancelString [

	^ (self 
		newTitle: aString 
		action: GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER
		acceptLabel: acceptString 
		cancelLabel: cancelString)
		initialize
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenFileTitle: aString [

	^ self newOpenFileTitle: aString acceptLabel: 'Open' cancelLabel: 'Cancel' 
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenFileTitle: aString acceptLabel: acceptString cancelLabel: cancelString [

	^ (self 
		newTitle: aString 
		action: GTK_FILE_CHOOSER_ACTION_OPEN 
		acceptLabel: acceptString 
		cancelLabel: cancelString)
		initialize
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newSaveFileTitle: aString [

	^ self newSaveFileTitle: aString acceptLabel: 'Save' cancelLabel: 'Cancel' 
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newSaveFileTitle: aString acceptLabel: acceptString cancelLabel: cancelString [

	^ (self 
		newTitle: aString 
		action: GTK_FILE_CHOOSER_ACTION_SAVE 
		acceptLabel: acceptString 
		cancelLabel: cancelString)
		initialize
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newTitle: title action: action acceptLabel: acceptString cancelLabel: cancelString [

	^ (self 
		newTitle: title
		action: action 
		firstButtonText: cancelString
		firstButtonId: GTK_RESPONSE_CANCEL
		secondButtonText: acceptString
		secondButtonId: GTK_RESPONSE_OK)
		initialize
]

{ #category : #private }
GtkFileChooserDialog class >> newTitle: title action: action firstButtonText: first_button_text firstButtonId: first_button_id [

	self ffiCall: #(GtkFileChooserDialog *gtk_file_chooser_dialog_new (
		const gchar *title,
		NULL,
		GtkFileChooserAction action,
		const gchar *first_button_text
		GtkResponseType first_button_id,
		NULL))
]

{ #category : #private }
GtkFileChooserDialog class >> newTitle: title action: action firstButtonText: first_button_text firstButtonId: first_button_id secondButtonText: second_button_text secondButtonId: second_button_id [

	self ffiCall: #(GtkFileChooserDialog *gtk_file_chooser_dialog_new (
		const gchar *title,
		NULL,
		GtkFileChooserAction action,
		const gchar *first_button_text,
		GtkResponseType first_button_id,
		const gchar *second_button_text,
		GtkResponseType second_button_id,
		NULL))
]

{ #category : #accessing }
GtkFileChooserDialog >> addBooleanChoice: title [
	| id |

	id := UUID new asString36. 

	self 
		addChoiceId: id 
		title: title 
		options:  ExternalAddress null
		labels: ExternalAddress null.
	
	^ id
]

{ #category : #accessing }
GtkFileChooserDialog >> addChoice: title options: anArrayOfStrings [
	| id options labels free |

	id := UUID new asString36. 

	free := Set new: anArrayOfStrings size * 2.	
	options := ByteArray new: (anArrayOfStrings size + 1) * FFIExternalType pointerSize.
	labels := ByteArray new: (anArrayOfStrings size + 1) * FFIExternalType pointerSize.
	anArrayOfStrings withIndexDo: [ :each :index | | pos |
		pos := ((index - 1) * FFIExternalType pointerSize) + 1.
		options pointerAt: pos put: (free add: (ExternalAddress fromString: index asString)).
		labels pointerAt: pos put: (free add: (ExternalAddress fromString: each asString)) ].
	
	self 
		addChoiceId: id 
		title: title 
		options:  options 
		labels: labels.
	
	free do: #free.
	
	^ id
]

{ #category : #private }
GtkFileChooserDialog >> addChoiceId: id title: label options: options labels: option_labels [
	
	self ffiCall: #(void gtk_file_chooser_add_choice (
		self,
		const char *id,
		const char *label,
		"const char **"void *options,
		"const char **"void *option_labels))
]

{ #category : #accessing }
GtkFileChooserDialog >> choiceAt: id [

	self ffiCall: #(const char *gtk_file_chooser_get_choice (self, const char *id))
]

{ #category : #accessing }
GtkFileChooserDialog >> choiceAt: id option: index [ 

	self setChoice: id option: index asString
]

{ #category : #accessing }
GtkFileChooserDialog >> currentFolder [

	^ self ffiCall: #(gchar *gtk_file_chooser_get_current_folder (self))
]

{ #category : #accessing }
GtkFileChooserDialog >> currentFolder: filename [

	^ self ffiCall: #(gboolean gtk_file_chooser_set_current_folder (self, const gchar *filename))
]

{ #category : #accessing }
GtkFileChooserDialog >> currentName [

	^ self ffiCall: #(gchar *gtk_file_chooser_get_current_name (self))
]

{ #category : #accessing }
GtkFileChooserDialog >> currentName: name [

	^ self ffiCall: #(void gtk_file_chooser_set_current_name (self, const gchar *name))
]

{ #category : #accessing }
GtkFileChooserDialog >> filename [ 

	self ffiCall: #(gchar *gtk_file_chooser_get_filename (self))
]

{ #category : #accessing }
GtkFileChooserDialog >> filename: filename [
"The file must exist. For a new filename use currentFilename:"
	self ffiCall: #(gboolean *gtk_file_chooser_set_filename (self, const gchar *filename))
]

{ #category : #accessing }
GtkFileChooserDialog >> overrideConfirmation: do_overwrite_confirmation [

	self ffiCall: #(void gtk_file_chooser_set_do_overwrite_confirmation (
		self,
		gboolean do_overwrite_confirmation))
]

{ #category : #private }
GtkFileChooserDialog >> setChoice: id option: option [

	^ self ffiCall: #(void gtk_file_chooser_set_choice (
		self, 
		const char *id,
		const char *option))
]
