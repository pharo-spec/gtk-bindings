"
An object to get the measure of a widget.
"
Class {
	#name : #GtkWidgetMeasure,
	#superclass : #Object,
	#instVars : [
		'orientation',
		'forSize',
		'widget',
		'minimum',
		'natural',
		'minimumBaseline',
		'naturalBaseline'
	],
	#category : #'Gtk-Widget'
}

{ #category : #'instance creation' }
GtkWidgetMeasure class >> new [

	self error: 'Use #newWidget:orientation:'
]

{ #category : #'instance creation' }
GtkWidgetMeasure class >> newWidget: aWidget orientation: anOrientation [

	^ self basicNew
		initializeWidget: aWidget orientation: anOrientation;
		yourself
]

{ #category : #accessing }
GtkWidgetMeasure >> forSize [

	^ forSize
]

{ #category : #accessing }
GtkWidgetMeasure >> forSize: aNumber [

	forSize := aNumber
]

{ #category : #initialization }
GtkWidgetMeasure >> initialize [

	super initialize.
	forSize := -1
]

{ #category : #initialization }
GtkWidgetMeasure >> initializeWidget: aWidget orientation: anOrientation [

	self initialize.
	widget := aWidget.
	orientation := anOrientation
]

{ #category : #execute }
GtkWidgetMeasure >> measure [
	| minimumBuffer naturalBuffer minimumBaselineBuffer naturalBaselineBuffer |

	minimumBuffer := FFIInt32 newBuffer.
	naturalBuffer := FFIInt32 newBuffer.
	minimumBaselineBuffer := FFIInt32 newBuffer.
	naturalBaselineBuffer := FFIInt32 newBuffer.

	self
		measureMinimum: minimumBuffer
		natural: naturalBuffer
		minimumBaseline: minimumBaselineBuffer
		naturalBaseline: naturalBaselineBuffer.

	minimum := minimumBuffer signedLongAt: 1.
	natural := naturalBuffer signedLongAt: 1.
	minimumBaseline := minimumBaselineBuffer signedLongAt: 1.
	naturalBaseline := naturalBaselineBuffer signedLongAt: 1
]

{ #category : #private }
GtkWidgetMeasure >> measureMinimum: minimumHandle natural: naturalHandle minimumBaseline: minimumBaselineHandle naturalBaseline: naturalBaselineHandle [

	self
		ffiCall: #(void
			gtk_widget_measure (
	  		GtkWidget* widget,
	  		GtkOrientation orientation,
	  		int forSize,
	  		int* minimumHandle,
	  		int* naturalHandle,
	  		int* minimumBaselineHandle,
	  		int* naturalBaselineHandle))
		module: GtkLibrary
]

{ #category : #accessing }
GtkWidgetMeasure >> minimum [

	^ minimum
]

{ #category : #accessing }
GtkWidgetMeasure >> minimumBaseline [

	^ minimumBaseline
]

{ #category : #accessing }
GtkWidgetMeasure >> natural [

	^ natural
]

{ #category : #accessing }
GtkWidgetMeasure >> naturalBaseline [

	^ naturalBaseline
]

{ #category : #accessing }
GtkWidgetMeasure >> orientation [

	^ orientation
]

{ #category : #accessing }
GtkWidgetMeasure >> widget [

	^ widget
]
