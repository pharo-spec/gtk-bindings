"
I contain gtk types.
"
Class {
	#name : #GtkTypes,
	#superclass : #SharedPool,
	#classVars : [
		'GPid',
		'GQuark',
		'GType',
		'gErrorHolder',
		'gboolean',
		'gchar',
		'gdouble',
		'gfloat',
		'gint',
		'gint16',
		'gint8',
		'glong',
		'gpointer',
		'gpointerHolder',
		'gsize',
		'gssize',
		'guchar',
		'guint',
		'guint16',
		'guint32',
		'guint8',
		'gulong',
		'gunichar'
	],
	#category : #'GObject-Base'
}

{ #category : #'class initialization' }
GtkTypes class >> initialize [

	gchar 	:= #char.
	guchar := #char.
	gpointer := #'void *'.
	gboolean := #FFIBoolean32.
	gulong :=  #ulong.
	glong :=  #long.
	gint := #int.
	gint8 := #int8.
	guint8 := #uint8.
	gint16 := #int16.
	guint16 := #uint16.
	guint := #uint.
	guint32 := #uint32.
	gfloat := #float.
	gdouble := #double.
	GQuark := #guint32.
	GType := #gsize.
	gssize := #long.
	gsize := #FFISizeT.
	
	gunichar := #guint32.
	
	GPid := #int.
	gpointerHolder := FFIExternalValueHolder ofType: gpointer.
	gErrorHolder := FFIExternalValueHolder ofType: 'GError *'.
]
