Extension { #name : #CairoLibrary }

{ #category : #'*Gtk' }
CairoLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'*Gtk' }
CairoLibrary >> macLibraryName [
	"since both Gtk3 and athens both use Cairo, I need to be sure we are going to 
	use same library (this also applies to freetype, btw)"
	self flag: #todo. "We will need to dispatch Gkt3 along with VM so this will not be needed"
	GtkLibrary isDebug ifTrue: [ ^ '/Users/gtk3/gtk/inst/lib/libcairo.2.dylib' ].
	^ '/usr/local/lib/libcairo.2.dylib'
]

{ #category : #'*Gtk' }
CairoLibrary >> runner [
	
	^ TFSameThreadRunner uniqueInstance
]
