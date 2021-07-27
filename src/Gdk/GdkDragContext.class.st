Class {
	#name : #GdkDragContext,
	#superclass : #GObject,
	#category : #'Gdk-Misc'
}

{ #category : #'as yet unclassified' }
GdkDragContext >> dropFinish: success time: time [

	self ffiCall: #(void gdk_drop_finish (self, gboolean success, guint32 time))
]
