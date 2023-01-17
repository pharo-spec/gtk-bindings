"
https://docs.gtk.org/gtk4/iface.Native.html
"
Trait {
	#name : #GtkTNative,
	#category : #'Gtk-Widget'
}

{ #category : #private }
GtkTNative >> getSurfaceTransformX: x y: y [

	self ffiCall: #(void gtk_native_get_surface_transform (
  		self,
  		void *x,
  		void *y))
]

{ #category : #api }
GtkTNative >> surface [

	^ self ffiCall: #(GdkSurface *gtk_native_get_surface (self))
]

{ #category : #api }
GtkTNative >> surfaceTransform [
	| xBuffer yBuffer |

	xBuffer := FFIFloat64 newBuffer.
	yBuffer := FFIFloat64 newBuffer.
	self getSurfaceTransformX: xBuffer y: yBuffer.

	^ (xBuffer doubleAt: 1) @ (yBuffer doubleAt: 1)
]
