"
Uses in GtkTreeDataStore (it uses selection data)
"
Class {
	#name : #GtkSelectionData,
	#superclass : #GBaseObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk-Misc'
}

{ #category : #accessing }
GtkSelectionData >> data [

	^ self ffiCall: #(const guchar *gtk_selection_data_get_data (self))
]

{ #category : #accessing }
GtkSelectionData >> setAtom: atom data: aString [

	^ self 
		setAtom: atom 
		format: 8 "bytes" 
		data: aString 
		length: aString size
]

{ #category : #accessing }
GtkSelectionData >> setAtom: type format: format data: data length: length [

	self ffiCall: #(void gtk_selection_data_set (
		self,
		GdkAtom type,
		gint format,
		const guchar *data,
		gint length))
	
]

{ #category : #accessing }
GtkSelectionData >> target [

	^ self ffiCall: #(GdkAtom gtk_selection_data_get_target (self))
]

{ #category : #accessing }
GtkSelectionData >> text [

	^ self ffiCall: #(guchar *gtk_selection_data_get_text (self))
]

{ #category : #accessing }
GtkSelectionData >> text: aString [

	^ self text: aString length: -1
]

{ #category : #accessing }
GtkSelectionData >> text: str length: len [

	^ self ffiCall: #(gboolean gtk_selection_data_set_text (self,
                             const gchar *str,
                             gint len))
]
