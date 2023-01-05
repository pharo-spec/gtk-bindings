Class {
	#name : #GdkDragContext,
	#superclass : #GObject,
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : #'Gdk-Misc'
}

{ #category : #accessing }
GdkDragContext >> dropFinish: success time: time [

	self ffiCall: #(void gdk_drop_finish (self, gboolean success, guint32 time))
]
