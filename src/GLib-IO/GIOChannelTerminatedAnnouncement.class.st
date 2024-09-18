Class {
	#name : 'GIOChannelTerminatedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'status'
	],
	#category : 'GLib-IO-Process',
	#package : 'GLib-IO',
	#tag : 'Process'
}

{ #category : 'instance creation' }
GIOChannelTerminatedAnnouncement class >> newStatus: status [

	^ self new status: status
]

{ #category : 'accessing' }
GIOChannelTerminatedAnnouncement >> status [

	^ status
]

{ #category : 'accessing' }
GIOChannelTerminatedAnnouncement >> status: anObject [

	status := anObject
]
