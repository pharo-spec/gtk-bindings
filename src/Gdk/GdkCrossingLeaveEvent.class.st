Class {
	#name : 'GdkCrossingLeaveEvent',
	#superclass : 'GdkCrossingEvent',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkCrossingLeaveEvent class >> isType: aType [

	^ aType = GDK_LEAVE_NOTIFY
]

{ #category : 'testing' }
GdkCrossingLeaveEvent >> isLeave [

	^ true
]
