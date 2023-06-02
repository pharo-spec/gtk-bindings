"
https://docs.gtk.org/gtk4/iface.SectionModel.html
"
Trait {
	#name : #GtkTSectionModel,
	#category : #'Gtk-Widget-ListView'
}

{ #category : #private }
GtkTSectionModel >> getSection: position start: out_start end: out_end [

	self ffiCall: #(void gtk_section_model_get_section (
		self, 
		guint position,
  		guint* out_start,
  		guint* out_end))
]

{ #category : #accessing }
GtkTSectionModel >> sectionAt: position [
	| startBuffer endBuffer |

	startBuffer := FFIUInt32 newBuffer.
	endBuffer := FFIUInt32 newBuffer.
	self getSection: position start: startBuffer end: endBuffer.
	
	^ (startBuffer uint32AtOffset: 0) to: (endBuffer uint32AtOffset: 0)
]

{ #category : #accessing }
GtkTSectionModel >> sectionsChangedAt: position numberOfItems: n_items [

	self ffiCall: #(void gtk_section_model_sections_changed (
		self,
  		guint position,
  		guint n_items))
]
