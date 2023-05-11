Class {
	#name : #GIOChannelTerminatedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'status'
	],
	#category : #'GLib-IO-Process'
}

{ #category : #'instance creation' }
GIOChannelTerminatedAnnouncement class >> newStatus: status [

	^ self new status: status
]

{ #category : #accessing }
GIOChannelTerminatedAnnouncement >> status [

	^ status
]

{ #category : #accessing }
GIOChannelTerminatedAnnouncement >> status: anObject [

	status := anObject
]
