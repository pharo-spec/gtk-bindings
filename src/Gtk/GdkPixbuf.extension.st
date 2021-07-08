Extension { #name : #GdkPixbuf }

{ #category : #'*Gtk' }
GdkPixbuf class >> newFromIconName: iconName size: size [

	^ GtkIconTheme default 
		loadIconName: iconName 
		size: size
]
