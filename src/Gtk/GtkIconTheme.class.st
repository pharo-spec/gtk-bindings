"
GtkIconTheme — Looking up icons by name

https://docs.gtk.org/gtk4/class.IconTheme.html
"
Class {
	#name : 'GtkIconTheme',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#pools : [
		'GtkIconLookupFlags',
		'GtkTextDirection'
	],
	#category : 'Gtk-Widget-Display',
	#package : 'Gtk',
	#tag : 'Widget-Display'
}

{ #category : 'instance creation' }
GtkIconTheme class >> default [

	^ self newForDisplay: GdkDisplay default
]

{ #category : 'private' }
GtkIconTheme class >> getForDisplay: display [

	^ self ffiCall: #(GtkIconTheme* gtk_icon_theme_get_for_display (GdkDisplay* display))
]

{ #category : 'instance creation' }
GtkIconTheme class >> newForDisplay: aDisplay [

	^ (self getForDisplay: aDisplay) initialize
]

{ #category : 'accessing' }
GtkIconTheme >> allContextNames [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkIconTheme >> allIcons [

	^ self allNames collect: [ :each | GtkImage newIconForButtonNamed: each ]
]

{ #category : 'accessing' }
GtkIconTheme >> allNames [
	| names namesAddress |

	namesAddress := self getIconNames.
	"a huge buffer, since this is always a huge list"
	names := Array new: 20000 streamContents: [ :stream |
		(namesAddress
			readArrayOf: FFIOop new
  			until: [ :each | each isNull ])
			do: [ :each |
				stream nextPut: each utf8StringFromCString.
				each gFree ] ].
	namesAddress gFree.

	^ names
]

{ #category : 'accessing' }
GtkIconTheme >> allNamesByContext [

	self deprecated: #Gtk4
]

{ #category : 'initialization' }
GtkIconTheme >> autoObjectUnref [

	"do not ref or unref, says the documentation"
]

{ #category : 'private' }
GtkIconTheme >> getIconNames [

	^ self ffiCall: #("char **"void *gtk_icon_theme_get_icon_names (self))
]

{ #category : 'private' }
GtkIconTheme >> getIconSizes: icon_name [

	^ self ffiCall: #("int*"void * gtk_icon_theme_get_icon_sizes (self, char* icon_name))
]

{ #category : 'private' }
GtkIconTheme >> getThemeName [

	^ self ffiCall: #(void* gtk_icon_theme_get_theme_name (self))
]

{ #category : 'testing' }
GtkIconTheme >> hasIcon: icon_name [

	^ self ffiCall: #(gboolean gtk_icon_theme_has_icon (self, char* icon_name))
]

{ #category : 'accessing' }
GtkIconTheme >> iconNamesInContext: aString [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkIconTheme >> iconSizesOf: aName [
	| sizes sizesAddress |

	sizesAddress := self getIconSizes: aName.
	sizes := Array streamContents: [ :stream |
		(sizesAddress
			readArrayOf: FFIInt32 new
  			until: [ :each | each isZero ])
			do: [ :each | stream nextPut: each ] ].
	sizesAddress gFree.

	^ sizes
]

{ #category : 'accessing' }
GtkIconTheme >> iconsInContext: aName [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkIconTheme >> listAllIcons [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkIconTheme >> listContexts [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkIconTheme >> listIcons: context [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkIconTheme >> loadIconName: iconName size: iconSize [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkIconTheme >> loadIconName: icon_name size: size flags: flags error: error [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkIconTheme >> lookupIconName: icon_name size: size [
	"this will reference the object, you take responsibility for unref it"
	
	^ self
		lookupIconName: icon_name
		size: size
		scale: 1
		direction: GTK_TEXT_DIR_NONE
		flags: GTK_ICON_LOOKUP_FORCE_REGULAR
]

{ #category : 'accessing' }
GtkIconTheme >> lookupIconName: icon_name size: size scale: scale direction: direction flags: flags [

	self ffiCall: #(GtkIconPaintable* gtk_icon_theme_lookup_icon (
  		self,
		const char* icon_name,
		"const char** fallbacks" NULL,
		int size,
		int scale,
		GtkTextDirection direction,
		GtkIconLookupFlags flags))
]

{ #category : 'accessing' }
GtkIconTheme >> name [
	| name nameAddress |

	nameAddress := self getThemeName.
	name := nameAddress utf8StringFromCString.
	nameAddress gFree.

	^ name
]
