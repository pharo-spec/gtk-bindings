"
https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/class.CompletionCell.html
"
Class {
	#name : #GtkSourceCompletionCell,
	#superclass : #GtkWidget,
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'widget'
	],
	#category : #'GtkSourceView-Completion'
}

{ #category : #accessing }
GtkSourceCompletionCell >> column [

	^ self ffiCall: #(GtkSourceCompletionColumn gtk_source_completion_cell_get_column (self))
]

{ #category : #private }
GtkSourceCompletionCell >> getWidget [

	self ffiCall: #(GtkWidget* gtk_source_completion_cell_get_widget (self))
]

{ #category : #accessing }
GtkSourceCompletionCell >> iconName: aName [

	self ffiCall: #(void gtk_source_completion_cell_set_icon_name (
  		self,
  		const char* aName))
]

{ #category : #accessing }
GtkSourceCompletionCell >> markup: markup [

	self ffiCall: #(void gtk_source_completion_cell_set_markup (
  		self,
  		const char* markup))
]

{ #category : #private }
GtkSourceCompletionCell >> setWidget: child [

	self ffiCall: #(void gtk_source_completion_cell_set_widget (
  		self,
  		GtkWidget* child))
]

{ #category : #accessing }
GtkSourceCompletionCell >> text: text [

	self ffiCall: #(void gtk_source_completion_cell_set_text (
  		self,
  		const char* text))
]

{ #category : #accessing }
GtkSourceCompletionCell >> widget [

	^ widget ifNil: [ widget := self getWidget ]
]

{ #category : #accessing }
GtkSourceCompletionCell >> widget: aWidget [

	widget := aWidget.
	self setWidget: aWidget
]
