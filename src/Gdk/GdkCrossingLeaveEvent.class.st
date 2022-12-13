Class {
	#name : #GdkCrossingLeaveEvent,
	#superclass : #GdkCrossingEvent,
	#category : #'Gdk-Events'
}

{ #category : #testing }
GdkCrossingLeaveEvent class >> isType: aType [

	^ aType = GDK_LEAVE_NOTIFY
]

{ #category : #testing }
GdkCrossingLeaveEvent >> isLeave [

	^ true
]
