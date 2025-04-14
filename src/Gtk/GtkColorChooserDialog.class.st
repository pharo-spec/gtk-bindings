Class {
	#name : 'GtkColorChooserDialog',
	#superclass : 'GtkSystemDialog',
	#pools : [
		'GtkOrientation'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'private' }
GtkColorChooserDialog class >> dialogNew: title parent: parent [

	self ffiCall: #(GtkColorChooserDialog *gtk_color_chooser_dialog_new (
	  const gchar* title,
	  GtkWindow *parent))
]

{ #category : 'instance creation' }
GtkColorChooserDialog class >> newTitle: aString [

	^ self newTitle: aString parent: GObject null
]

{ #category : 'instance creation' }
GtkColorChooserDialog class >> newTitle: aString parent: parent [

	^ (self dialogNew: aString parent: parent) initialize
]

{ #category : 'accessing' }
GtkColorChooserDialog >> addHorizontalPalette: colors lineSize: line [

	self 
		addPalette: colors 
		orientation: GTK_ORIENTATION_HORIZONTAL 
		lineSize: line
]

{ #category : 'private' }
GtkColorChooserDialog >> addPalette: colors orientation: orientation line: colors_per_line numColors: n_colors [

	self ffiCall: #(void gtk_color_chooser_add_palette (
		self,
		GtkOrientation orientation,
		gint colors_per_line,
		gint n_colors,
		"GdkRGBA *"void *colors))

]

{ #category : 'private' }
GtkColorChooserDialog >> addPalette: colors orientation: orientation lineSize: line [
	| colorsArray |

	colorsArray := ByteArray streamContents: [ :stream |
		colors do: [ :each |
			stream nextPutAll: each asGdkRGBA getHandle ] ].
	
	self 
		addPalette: colorsArray 
		orientation: orientation 
		line: line
		numColors: colors size
]

{ #category : 'accessing' }
GtkColorChooserDialog >> addVerticalPalette: colors lineSize: line [

	self 
		addPalette: colors 
		orientation: GTK_ORIENTATION_VERTICAL 
		lineSize: line
]

{ #category : 'accessing' }
GtkColorChooserDialog >> color [

	^ self colorRGBA asColor
]

{ #category : 'accessing' }
GtkColorChooserDialog >> color: aColor [

	self colorRGBA: aColor asGdkRGBA
]

{ #category : 'accessing' }
GtkColorChooserDialog >> colorRGBA [
	| rgba |
	
	rgba := GdkRGBA new.
	self getRGBA: rgba.
	^ rgba
]

{ #category : 'accessing' }
GtkColorChooserDialog >> colorRGBA: rgba [

	self setRGBA: rgba
]

{ #category : 'private' }
GtkColorChooserDialog >> getRGBA: color [

	self ffiCall: #(void gtk_color_chooser_get_rgba (
  		self,
  		const GdkRGBA* color))
]

{ #category : 'private' }
GtkColorChooserDialog >> setRGBA: color [

	self ffiCall: #(void gtk_color_chooser_set_rgba (
  		self,
  		const GdkRGBA* color))
]
