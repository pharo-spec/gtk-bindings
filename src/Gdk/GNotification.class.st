"
[https://developer.gnome.org/gio/stable/GNotification.html](https://developer.gnome.org/gio/stable/GNotification.html)
"
Class {
	#name : #GNotification,
	#superclass : #GObject,
	#category : #'Gdk-Base'
}

{ #category : #private }
GNotification class >> gNotificationNew: title [ 

	^ self ffiCall: #(GNotification *g_notification_new (const gchar *title))
]

{ #category : #'instance creation' }
GNotification class >> newTitle: aString [

	^ (self gNotificationNew: aString) initialize
]

{ #category : #accessing }
GNotification >> body: body [

	self ffiCall: #(void g_notification_set_body (self, const gchar *body))
]

{ #category : #'old api' }
GNotification >> send [

	self sendTo: GApplication default
]

{ #category : #'old api' }
GNotification >> sendTo: application [ 

	application sendNotification: self
]

{ #category : #accessing }
GNotification >> title: title [

	self ffiCall: #(void g_notification_set_title (self, const gchar *title))
]
