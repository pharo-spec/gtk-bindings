"
GtkSourceMarkAttributes — The source mark attributes object
https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/class.MarkAttributes.html

"
Class {
	#name : 'GtkSourceMarkAttributes',
	#superclass : 'GObject',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#category : 'GtkSourceView-Base',
	#package : 'GtkSourceView',
	#tag : 'Base'
}

{ #category : 'instance creation' }
GtkSourceMarkAttributes class >> new [

	^ self sourceMarkAttributesNew initialize
]

{ #category : 'private' }
GtkSourceMarkAttributes class >> sourceMarkAttributesNew [

	^ self 
		ffiCall: #(GtkSourceMarkAttributes *gtk_source_mark_attributes_new (void))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceMarkAttributes >> background [
	| background |

	background := GdkRGBA new.
	^ (self getBackground: background)
		ifTrue: [ background ]
		ifFalse: [ nil ]
]

{ #category : 'accessing' }
GtkSourceMarkAttributes >> background: background [

	^ self 
		ffiCall: #(void gtk_source_mark_attributes_set_background (self, const GdkRGBA *background))
		module: GtkSourceViewLibrary
]

{ #category : 'signaling' }
GtkSourceMarkAttributes >> connectQueryTooltipMarkup: aBlock [ 

	self 
		connect: 'query-tooltip-markup'
		signature: #(void* (void* selfhandle, void* markHandle, gpointer user_data))
		do: [ :selfHandle :markHandle :user_data | 
			logger trace.
			(aBlock value: (GtkSourceMark fromHandleUnowned: markHandle))
				ifNotNil: [ :aString | GLibLibrary uniqueInstance gstrdup: aString]
				ifNil: [ ExternalAddress null ] ]
]

{ #category : 'signaling' }
GtkSourceMarkAttributes >> connectQueryTooltipText: aBlock [ 

	self 
		connect: 'query-tooltip-text'
		signature: #(void* (void* selfhandle, void* markHandle, gpointer user_data))
		do: [ :selfHandle :markHandle :user_data |
			"you need to answer an instant that can be destroyed by the caller. 
			 you can use `GLibLibrary>>#gstrdup:` for that"
			aBlock value: (GtkSourceMark fromHandleUnowned: markHandle) ]
]

{ #category : 'private' }
GtkSourceMarkAttributes >> getBackground: background [

	^ self 
		ffiCall: #(gboolean gtk_source_mark_attributes_get_background (self, GdkRGBA *background))
		module: GtkSourceViewLibrary	
]

{ #category : 'accessing' }
GtkSourceMarkAttributes >> iconName [

	^ self 
		ffiCall: #(gchar *gtk_source_mark_attributes_get_icon_name(self)) 
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceMarkAttributes >> iconName: icon_name [

	^ self 
		ffiCall: #(void gtk_source_mark_attributes_set_icon_name(self, const gchar *icon_name)) 
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceMarkAttributes >> pixbuf [

	^ self 
		ffiCall: #(GdkPixbuf *gtk_source_mark_attributes_get_pixbuf(self)) 
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceMarkAttributes >> pixbuf: pixbuf [

	^ self 
		ffiCall: #(void gtk_source_mark_attributes_set_pixbuf(self, GdkPixbuf *pixbuf)) 
		module: GtkSourceViewLibrary
]
