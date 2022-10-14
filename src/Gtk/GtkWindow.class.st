"
GtkWindow — Toplevel which can contain other widgets.

https://developer.gnome.org/gtk3/stable/GtkWindow.html
"
Class {
	#name : #GtkWindow,
	#superclass : #GtkContainer,
	#instVars : [
		'acceleratorGroups',
		'cursor',
		'child'
	],
	#pools : [
		'GtkWindowPosition',
		'GtkWindowType'
	],
	#category : #'Gtk-Widget-Window'
}

{ #category : #finalization }
GtkWindow class >> finalizeResourceData: aHandle [

	(self isValidHandle: aHandle) ifFalse: [ ^ self ].
	GFinalizeAnnouncement emitTarget: self handle: aHandle.
	"self widgetDestroy: aHandle."
	aHandle beNull
]

{ #category : #accessing }
GtkWindow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_window_get_type())
]

{ #category : #'instance creation' }
GtkWindow class >> new [ 
	^ (self windowNew: GTK_WINDOW_TOPLEVEL) initialize
]

{ #category : #'instance creation' }
GtkWindow class >> newPopup [

	^ (self windowNew: GTK_WINDOW_POPUP) initialize
]

{ #category : #private }
GtkWindow class >> windowNew: type [ 

	^ self ffiCall: #( GtkWindow *gtk_window_new ( GtkWindowType type ) )
]

{ #category : #accessing }
GtkWindow >> addAcceleratorGroup: anAcceleratorGroup [

	acceleratorGroups ifNil: [ acceleratorGroups := Set new ].
	acceleratorGroups add: anAcceleratorGroup.
	self windowAddAccelGroup: anAcceleratorGroup
]

{ #category : #accessing }
GtkWindow >> attachedTo: widget [
	
	self ffiCall: #(void gtk_window_set_attached_to (self, GtkWidget *widget))
]

{ #category : #'external resource management' }
GtkWindow >> autoRelease [
	"autoReleasing windows is more complicated than the usual WeakRegistry mechanism, since 
	 I can have strong references to self in callbacks (due to the events registered). 
	 Therefore, I need a better mechanism and this is well handled by EphemeronRegistry. 
	 This will call the regular #finalize method from this object"
	self flag: #TODO. "Verify this"
	super autoRelease
]

{ #category : #accessing }
GtkWindow >> beDecorated [

	self decorated: true
]

{ #category : #accessing }
GtkWindow >> beModal [

	self modal: true
]

{ #category : #accessing }
GtkWindow >> beNotDecorated [

	self decorated: false
]

{ #category : #accessing }
GtkWindow >> beNotModal [

	self modal: false
]

{ #category : #accessing }
GtkWindow >> beep [ 

	self gdkWindow beep
]

{ #category : #geometry }
GtkWindow >> bounds [

	^ self position extent: self defaultSize
]

{ #category : #geometry }
GtkWindow >> bounds: aRectangle [

	self moveTo: aRectangle origin.
	self defaultSize: aRectangle extent
]

{ #category : #geometry }
GtkWindow >> center [
	"Sets position as 'center' to be applied *before* window is opened."
	
	"self isVisible 
		ifTrue: [ self moveTo: (self display primaryMonitor geometry extent - self size) // 2 ]
		ifFalse: [ "self setPosition: GTK_WIN_POS_CENTER" ]"
]

{ #category : #accessing }
GtkWindow >> child [

	^ child ifNil: [ child := self getChild ]
]

{ #category : #accessing }
GtkWindow >> child: aWidget [

	child := aWidget.
	self setChild: aWidget
]

{ #category : #showing }
GtkWindow >> close [

	self ffiCall: #(void gtk_window_close (self))
]

{ #category : #signaling }
GtkWindow >> connectActivateFocus: aBlock [

	self connect: 'activate-focus' do: aBlock
]

{ #category : #signaling }
GtkWindow >> connectDefaultHeight: aBlock [
	"aBlock receives an optional parameter (the GObject.ParamSpec* pspec)"

	self connectNotifyProperty: 'default-height' do: aBlock
]

{ #category : #signaling }
GtkWindow >> connectDefaultWidth: aBlock [
	"aBlock receives an optional parameter (the GObject.ParamSpec* pspec)"

	self connectNotifyProperty: 'default-width' do: aBlock
]

{ #category : #accessing }
GtkWindow >> cursor: aGdkCursor [

	cursor := aGdkCursor.
	self gdkWindow cursor: cursor
]

{ #category : #private }
GtkWindow >> decorated: setting [

	self ffiCall: #(void gtk_window_set_decorated (self, gboolean setting))
]

{ #category : #geometry }
GtkWindow >> defaultSize [
	| width height |
	
	width := FFIInt32 newBuffer.
	height := FFIInt32 newBuffer.
	
	self getDefaultSizeWidth: width height: height. 
	
	^ (width signedLongAt: 1) @ (height signedLongAt: 1)
]

{ #category : #geometry }
GtkWindow >> defaultSize: aPoint [

	self 
		setDefaultSizeWidth: aPoint x asInteger
		height: aPoint y asInteger
]

{ #category : #accessing }
GtkWindow >> extent [

	^ (self gObjectGetInteger: 'default-width')@(self gObjectGetInteger: 'default-height')
]

{ #category : #private }
GtkWindow >> getChild [

	self ffiCall: #(GtkWidget *gtk_window_get_child (self))
]

{ #category : #private }
GtkWindow >> getDefaultSizeWidth: width height: height [

	^ self ffiCall: #(void gtk_window_get_default_size (self, gint *width, gint *height))
]

{ #category : #private }
GtkWindow >> getPositionX: root_x y: root_y [

	^ self ffiCall: #(void gtk_window_get_position (self, gint *root_x, gint *root_y))
]

{ #category : #geometry }
GtkWindow >> gravity [

	^ self ffiCall: #(GdkGravity gtk_window_get_gravity (self))
]

{ #category : #geometry }
GtkWindow >> gravity: gravity [

	^ self ffiCall: #(void gtk_window_set_gravity (self, GdkGravity gravity))
]

{ #category : #testing }
GtkWindow >> hasTopLevelFocus [

	^ self ffiCall: #(gboolean gtk_window_has_toplevel_focus (self))
]

{ #category : #private }
GtkWindow >> iconify [

	self ffiCall: #(void gtk_window_iconify (self))
]

{ #category : #initialization }
GtkWindow >> initialize [

	super initialize.
	"registering to prevent GC"
	self engine registerWindow: self.
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ self windowDestroyed ]
]

{ #category : #testing }
GtkWindow >> isActive [

	^ self ffiCall: #(gboolean gtk_window_is_active (self))
]

{ #category : #testing }
GtkWindow >> isDecorated [

	^ self ffiCall: #(gboolean gtk_window_get_decorated (self))
]

{ #category : #testing }
GtkWindow >> isMaximized [

	^ self ffiCall: #(gboolean gtk_window_is_maximized (self))
]

{ #category : #testing }
GtkWindow >> isModal [ 

	^ self ffiCall: #(gboolean gtk_window_get_modal (self))
]

{ #category : #testing }
GtkWindow >> isResizable [

	^ self ffiCall: #(gboolean gtk_window_get_resizable (self))
]

{ #category : #private }
GtkWindow >> maximize [

	self ffiCall: #(void gtk_window_maximize (self))
]

{ #category : #private }
GtkWindow >> modal: modal [

	^ self ffiCall: #(void gtk_window_set_modal (self, gboolean modal))
]

{ #category : #geometry }
GtkWindow >> moveTo: aPoint [

	self moveX: aPoint x y: aPoint y
]

{ #category : #geometry }
GtkWindow >> moveToCenter [ 

	self moveTo: (self display primaryMonitor geometry extent - self defaultSize) // 2
]

{ #category : #private }
GtkWindow >> moveX: x y: y [

	^ self ffiCall: #(void gtk_window_move (self, gint x, gint y))
]

{ #category : #geometry }
GtkWindow >> position [
	| rootX rootY |
	
	rootX := FFIInt32 newBuffer.
	rootY := FFIInt32 newBuffer.
	
	self getPositionX: rootX y: rootY. 
	
	^ (rootX signedLongAt: 1) @ (rootY signedLongAt: 1)
]

{ #category : #showing }
GtkWindow >> present [

	^ self ffiCall: #(void gtk_window_present (self))
]

{ #category : #accessing }
GtkWindow >> propagateKeyEvent: event [

	^ self ffiCall: #(gboolean gtk_window_propagate_key_event (self, GdkEventKey *event))
]

{ #category : #accessing }
GtkWindow >> removeAcceleratorGroup: anAcceleratorGroup [

	(acceleratorGroups includes: anAcceleratorGroup) ifFalse: [ ^ self ].
	self windowRemoveAccelGroup: anAcceleratorGroup.
	acceleratorGroups remove: anAcceleratorGroup
	
]

{ #category : #accessing }
GtkWindow >> resizable: resizable [

	self ffiCall: #(void gtk_window_set_resizable (self, gboolean resizable))
]

{ #category : #geometry }
GtkWindow >> resize: aPoint [

	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver resize: `@arg1' -> '`@receiver defaultSize: `@arg1'.

	^ self defaultSize: aPoint		
]

{ #category : #geometry }
GtkWindow >> scaleFactor [
	"See https://developer.gnome.org/gdk3/stable/gdk3-Windows.html#gdk-window-get-scale-factor"

	^ self ffiCall: #(gint gdk_window_get_scale_factor (self))
]

{ #category : #private }
GtkWindow >> setChild: aWidget [

	self ffiCall: #(void gtk_window_set_child (self, GtkWidget *aWidget))
]

{ #category : #private }
GtkWindow >> setDefaultSizeWidth: width height: height [

	^ self ffiCall: #(void gtk_window_set_default_size (self, gint width, gint height))
]

{ #category : #private }
GtkWindow >> setPosition: position [
	"This is how it will be positioned WHEN showing (not after)"

	self ffiCall: #(void gtk_window_set_position ( self, GtkWindowPosition position ) )
]

{ #category : #accessing }
GtkWindow >> show [
	| titleBar |
	
	self withAllChildrenDo: #executeDeferredActions.
	self flag: #TODO. "All this checking is because current TFFI does not answers correctly nil when 
	address answered is NULL. This will be fixed and this will not be necesary :)"
	titleBar := self titleBar.
	(titleBar notNil and: [ titleBar getHandle isNull not ]) 
		ifTrue: [ titleBar showAll ].
	super show
]

{ #category : #accessing }
GtkWindow >> showAll [
	"We have to do in this way to avoid the selection of the first element in a list"

	self 
		deprecated: 'Removed in Gtk4' 
		transformWith: 
			   '`@receiver showAll' 
			-> '`@receiver present'.
				
	self present
]

{ #category : #geometry }
GtkWindow >> size [
	
	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver size' -> '`@receiver defaultSize'.
		
	^ self defaultSize
]

{ #category : #accessing }
GtkWindow >> title [ 
	^ self ffiCall: #(const gchar *gtk_window_get_title (self))
]

{ #category : #accessing }
GtkWindow >> title: title [
	^ self ffiCall: #(void gtk_window_set_title (self, String title))
]

{ #category : #accessing }
GtkWindow >> titleBar [

	self ffiCall: #(GtkWidget *gtk_window_get_titlebar (self))
]

{ #category : #accessing }
GtkWindow >> titleBar: aTitleBar [

	self ffiCall: #(void gtk_window_set_titlebar (self, GtkWidget *aTitleBar))
]

{ #category : #accessing }
GtkWindow >> transientTo: parent [
	
	self ffiCall: #(void gtk_window_set_transient_for (self, GtkWindow *parent))
]

{ #category : #private }
GtkWindow >> unregister [

	"if this is the last window and I'm closing the app, it can happen than a destroy 
	 is called after the GtkApplication is disposed. I need to verify if is nil to avoid 
	 saving errors."
	self engine ifNotNil: [ :app | 
		app unregisterWindow: self ]
]

{ #category : #private }
GtkWindow >> windowAddAccelGroup: accel_group [

	^ self ffiCall: #(void gtk_window_add_accel_group (self, GtkAccelGroup *accel_group))
]

{ #category : #finalization }
GtkWindow >> windowDestroyed [
	"This process a destroy signal"

	GWindowDestroyAnnouncement emitWidget: self.
	"according to documentation: Signals that all holders of a reference to the widget should 
	 release the reference that they hold. May result in finalization of the widget if all 
	 references are released.
	 Seems to mean if I receive the destroy signal, window no longer exist (and I do not need 
	 to re-trigger destroy on it."	
	handle beNull.
	
	self unregister
]

{ #category : #private }
GtkWindow >> windowRemoveAccelGroup: accel_group [

	^ self ffiCall: #(void gtk_window_remove_accel_group (self, GtkAccelGroup *accel_group))
]
