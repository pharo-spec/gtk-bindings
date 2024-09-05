"
The “scroll-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::scroll-event signal is emitted when a button in the 4 to 7 range is pressed. Wheel mice are usually configured to generate button press events for buttons 4 and 5 when the wheel is turned.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_SCROLL_MASK mask.
This signal will be sent to the grab widget if there is one.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-scroll-event
"
Class {
	#name : 'GScrollEventCallback',
	#superclass : 'GManagedSignalCallback',
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'accessing' }
GScrollEventCallback class >> signalName [

	^ 'scroll-event'
]

{ #category : 'accessing' }
GScrollEventCallback >> do: aBlock [

	super do: [ :widget :dx :dy :user_data |
		aBlock value: (GdkSimulatedScrollEvent new 
			dx: dx;
			dy: dy;
			yourself) ]
]

{ #category : 'accessing' }
GScrollEventCallback >> signature [

	^ #(gboolean (void *widget, gdouble dx, gdouble dy, void *user_data))
]
