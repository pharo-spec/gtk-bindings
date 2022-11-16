"
GtkVolumeButton
GtkVolumeButton — A button which pops up a volume control

https://developer.gnome.org/gtk3/unstable/GtkVolumeButton.html
"
Class {
	#name : #GtkVolumeButton,
	#superclass : #GtkScaleButton,
	#category : #'Gtk-Widget-Buttons'
}

{ #category : #private }
GtkVolumeButton class >> buttonNew [

	^ self ffiCall: #(GtkVolumeButton *gtk_volume_button_new (void))
]

{ #category : #accessing }
GtkVolumeButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_volume_button_get_type())
]

{ #category : #private }
GtkVolumeButton class >> newWithMin: min max: max step: step icons: iconNamesOrNil [

	self shouldNotImplement
]
