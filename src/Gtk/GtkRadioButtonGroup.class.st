"
I implement a convenience interface to a gtk radio button.
A radio button group is implemented in gtk as a GSList.

Do not create me manually! Check GtkRadioButton instead.
"
Class {
	#name : 'GtkRadioButtonGroup',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-Buttons',
	#package : 'Gtk',
	#tag : 'Widget-Buttons'
}

{ #category : 'accessing' }
GtkRadioButtonGroup class >> gType [ 

	^ nil
]
