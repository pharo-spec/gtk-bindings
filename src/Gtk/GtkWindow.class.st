"
GtkWindow — Toplevel which can contain other widgets.

https://developer.gnome.org/gtk3/stable/GtkWindow.html
"
Class {
	#name : 'GtkWindow',
	#superclass : 'GtkWidget',
	#traits : 'GtkTRoot + GtkTNative',
	#classTraits : 'GtkTRoot classTrait + GtkTNative classTrait',
	#instVars : [
		'cursor',
		'child',
		'defaultWidget'
	],
	#pools : [
		'GtkWindowPosition',
		'GtkWindowType'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'examples' }
GtkWindow class >> example [
	| window |

	GEngine ensureRunning.
	GRunLoop defer: [
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example Window'.
		window child: (GtkLabel newLabel: 'Window').
		window present ]
]

{ #category : 'examples' }
GtkWindow class >> exampleModal [
	| window |

	GEngine ensureRunning.
	GRunLoop defer: [
		window := GtkWindow new.
		window defaultSize: 600@400.
		window title: 'Example Window'.
		window child: (GtkLabel newLabel: 'Window').
		window beModal.
		window present ]
]

{ #category : 'examples' }
GtkWindow class >> exampleModalWithTransient [
	| mainWindow transientWindow |

	GEngine ensureRunning.
	GRunLoop defer: [
		mainWindow := GtkWindow new.
		mainWindow defaultSize: 600@400.
		mainWindow title: 'Example Window'.
		mainWindow child: (GtkLabel newLabel: 'Window').
		mainWindow present.

		transientWindow := GtkWindow new.
		transientWindow defaultSize: 300@200.
		transientWindow title: 'Example Transient'.
		transientWindow child: (GtkLabel newLabel: 'Transient').
		transientWindow beModal.
		transientWindow transientTo: mainWindow.
		transientWindow present ]
]

{ #category : 'examples' }
GtkWindow class >> exampleModalWithTransientBlocking [
	"how a dialog should run now (since GtkDialog is now deprecated)"
	| mainWindow transientWindow sem |

	GEngine ensureRunning.
	GRunLoop defer: [
		mainWindow := GtkWindow new.
		mainWindow defaultSize: 600@400.
		mainWindow title: 'Example Window'.
		mainWindow child: (GtkLabel newLabel: 'Window').
		mainWindow present ].

	sem := Semaphore new.

	GRunLoop defer: [
		transientWindow := GtkWindow new.
		transientWindow defaultSize: 300@200.
		transientWindow title: 'Example Transient'.
		transientWindow child: (GtkLabel newLabel: 'Transient').
		transientWindow beModal.
		transientWindow transientTo: mainWindow.
		transientWindow beHideOnClose.
		transientWindow connectHide: [ sem signal ].
		transientWindow present ].

	sem wait.
	'OK' crTrace.
	GRunLoop defer: [ transientWindow objectUnref ]
]

{ #category : 'accessing' }
GtkWindow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_window_get_type())
]

{ #category : 'private' }
GtkWindow class >> listTopLevels [

	^ self ffiCall: #(GList* gtk_window_list_toplevels (void))
]

{ #category : 'instance creation' }
GtkWindow class >> new [ 
	^ (self windowNew: GTK_WINDOW_TOPLEVEL) initialize
]

{ #category : 'instance creation' }
GtkWindow class >> newPopup [

	^ (self windowNew: GTK_WINDOW_POPUP) initialize
]

{ #category : 'private' }
GtkWindow class >> windowNew: type [ 

	^ self ffiCall: #( GtkWindow *gtk_window_new ( GtkWindowType type ) )
]

{ #category : 'accessing' }
GtkWindow >> addAcceleratorGroup: anAcceleratorGroup [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkWindow >> attachedTo: widget [

	self deprecated: #Gtk4
]

{ #category : 'external resource management' }
GtkWindow >> autoRelease [
	"autoReleasing windows is more complicated than the usual WeakRegistry mechanism, since 
	 I can have strong references to self in callbacks (due to the events registered). 
	 Therefore, I need a better mechanism and this is well handled by EphemeronRegistry. 
	 This will call the regular #finalize method from this object"
	self flag: #TODO. "Verify this"
	super autoRelease
]

{ #category : 'private' }
GtkWindow >> basicPresent [

	^ self ffiCall: #(void gtk_window_present (self))
]

{ #category : 'accessing' }
GtkWindow >> beDecorated [

	self decorated: true
]

{ #category : 'accessing' }
GtkWindow >> beHideOnClose [

	self hideOnClose: true
]

{ #category : 'accessing' }
GtkWindow >> beModal [

	self modal: true
]

{ #category : 'accessing' }
GtkWindow >> beNotDecorated [

	self decorated: false
]

{ #category : 'accessing' }
GtkWindow >> beNotHideOnClose [

	self hideOnClose: false
]

{ #category : 'accessing' }
GtkWindow >> beNotModal [

	self modal: false
]

{ #category : 'accessing' }
GtkWindow >> beep [ 

	self surface beep
]

{ #category : 'geometry' }
GtkWindow >> bounds [

	^ self position extent: self defaultSize
]

{ #category : 'geometry' }
GtkWindow >> bounds: aRectangle [

	"gtk4 does not really knows what to do with the position, we can just take the extent"
	self defaultSize: aRectangle extent
]

{ #category : 'geometry' }
GtkWindow >> center [
	"Sets position as 'center' to be applied *before* window is opened."
	
	"there is no way to do this"
	self deprecated: #Gtk4. 
	
]

{ #category : 'accessing' }
GtkWindow >> child [

	^ child ifNil: [ child := self getChild ]
]

{ #category : 'accessing' }
GtkWindow >> child: aWidget [

	child := aWidget.
	self setChild: aWidget
]

{ #category : 'showing' }
GtkWindow >> close [

	self ffiCall: #(void gtk_window_close (self))
]

{ #category : 'signaling' }
GtkWindow >> connectActivateFocus: aBlock [

	self connect: 'activate-focus' do: aBlock
]

{ #category : 'signaling' }
GtkWindow >> connectCloseRequest: aBlock [

	(GtkCloseRequestCallback do: aBlock) connectTo: self
]

{ #category : 'signaling' }
GtkWindow >> connectDefaultHeight: aBlock [
	"aBlock receives an optional parameter (the GObject.ParamSpec* pspec)"

	self connectNotifyProperty: 'default-height' do: aBlock
]

{ #category : 'signaling' }
GtkWindow >> connectDefaultWidth: aBlock [
	"aBlock receives an optional parameter (the GObject.ParamSpec* pspec)"

	self connectNotifyProperty: 'default-width' do: aBlock
]

{ #category : 'accessing' }
GtkWindow >> cursor: aGdkCursor [

	cursor := aGdkCursor.
	self surface cursor: cursor
]

{ #category : 'private' }
GtkWindow >> decorated: setting [

	self ffiCall: #(void gtk_window_set_decorated (self, gboolean setting))
]

{ #category : 'geometry' }
GtkWindow >> defaultSize [
	| width height |
	
	width := FFIInt32 newBuffer.
	height := FFIInt32 newBuffer.
	
	self getDefaultSizeWidth: width height: height. 
	
	^ (width signedLongAt: 1) @ (height signedLongAt: 1)
]

{ #category : 'geometry' }
GtkWindow >> defaultSize: aPoint [

	self 
		setDefaultSizeWidth: aPoint x asInteger
		height: aPoint y asInteger
]

{ #category : 'accessing' }
GtkWindow >> defaultWidget: aWidget [

	defaultWidget := aWidget.
	self setDefaultWidget: aWidget
]

{ #category : 'accessing' }
GtkWindow >> destroy [

	self ffiCall: #(void gtk_window_destroy (self))
]

{ #category : 'accessing' }
GtkWindow >> extent [

	^ (self gObjectGetInteger: 'default-width')@(self gObjectGetInteger: 'default-height')
]

{ #category : 'finalization' }
GtkWindow >> finalize [
	"beware, since hide_on_close = false, window will be destroyed when hiding it 
	 (causing all tree to be released, including the window). We can't then destroy 
	 it here. BUT! if you set hide_on_close = true, then you will need to destroy it 
	 by hand too."
	
	GFinalizeAnnouncement emitTarget: self handle: handle.
	"self isAlive ifTrue: [ 
		self withObjectReferenceDo: [ self destroy ] ]."
	handle beNull
]

{ #category : 'accessing' }
GtkWindow >> getChild [

	self ffiCall: #(GtkWidget *gtk_window_get_child (self))
]

{ #category : 'private' }
GtkWindow >> getDefaultSizeWidth: width height: height [

	^ self ffiCall: #(void gtk_window_get_default_size (self, gint *width, gint *height))
]

{ #category : 'private' }
GtkWindow >> getPositionX: root_x y: root_y [

	self deprecated: #Gtk4
]

{ #category : 'geometry' }
GtkWindow >> gravity [

	self deprecated: #Gtk4
]

{ #category : 'geometry' }
GtkWindow >> gravity: gravity [

	self deprecated: #Gtk4
]

{ #category : 'testing' }
GtkWindow >> hasTopLevelFocus [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkWindow >> hideOnClose: setting [

	self ffiCall: #(void gtk_window_set_hide_on_close (self, gboolean setting))
]

{ #category : 'private' }
GtkWindow >> iconify [

	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver iconify' - '`@receiver minimize'.
		
	self minimize
]

{ #category : 'initialization' }
GtkWindow >> initialize [

	super initialize.
	"registering to prevent GC"
	self engine registerWindow: self.
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ self windowDestroyed ]
]

{ #category : 'testing' }
GtkWindow >> isActive [

	^ self ffiCall: #(gboolean gtk_window_is_active (self))
]

{ #category : 'testing' }
GtkWindow >> isDecorated [

	^ self ffiCall: #(gboolean gtk_window_get_decorated (self))
]

{ #category : 'testing' }
GtkWindow >> isHideOnClose [

	^ self ffiCall: #(gboolean gtk_window_get_hide_on_close (self))
]

{ #category : 'testing' }
GtkWindow >> isMaximized [

	^ self ffiCall: #(gboolean gtk_window_is_maximized (self))
]

{ #category : 'testing' }
GtkWindow >> isModal [ 

	^ self ffiCall: #(gboolean gtk_window_get_modal (self))
]

{ #category : 'testing' }
GtkWindow >> isResizable [

	^ self ffiCall: #(gboolean gtk_window_get_resizable (self))
]

{ #category : 'private' }
GtkWindow >> maximize [

	self ffiCall: #(void gtk_window_maximize (self))
]

{ #category : 'private' }
GtkWindow >> minimize [

	self ffiCall: #(void gtk_window_minimize (self))
]

{ #category : 'private' }
GtkWindow >> modal: modal [

	^ self ffiCall: #(void gtk_window_set_modal (self, gboolean modal))
]

{ #category : 'geometry' }
GtkWindow >> moveTo: aPoint [

	self deprecated: #Gtk4. "can't be done"

]

{ #category : 'geometry' }
GtkWindow >> moveToCenter [ 

	self deprecated: #Gtk4. "can't be done"

]

{ #category : 'private' }
GtkWindow >> moveX: x y: y [

	self deprecated: #Gtk4. "can't be done"

]

{ #category : 'geometry' }
GtkWindow >> position [

	self deprecated: #Gtk4
]

{ #category : 'showing' }
GtkWindow >> present [

	self withAllChildrenDo: #executeDeferredActions.
	self basicPresent
]

{ #category : 'accessing' }
GtkWindow >> propagateKeyEvent: event [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkWindow >> removeAcceleratorGroup: anAcceleratorGroup [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkWindow >> resizable: resizable [

	self ffiCall: #(void gtk_window_set_resizable (self, gboolean resizable))
]

{ #category : 'geometry' }
GtkWindow >> resize: aPoint [

	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver resize: `@arg1' -> '`@receiver defaultSize: `@arg1'.

	^ self defaultSize: aPoint		
]

{ #category : 'geometry' }
GtkWindow >> scaleFactor [
	"See https://developer.gnome.org/gdk3/stable/gdk3-Windows.html#gdk-window-get-scale-factor"

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkWindow >> setChild: aWidget [

	self ffiCall: #(void gtk_window_set_child (self, GtkWidget *aWidget))
]

{ #category : 'private' }
GtkWindow >> setDefaultSizeWidth: width height: height [

	^ self ffiCall: #(void gtk_window_set_default_size (self, gint width, gint height))
]

{ #category : 'private' }
GtkWindow >> setDefaultWidget: default_widget [

	self ffiCall: #(void gtk_window_set_default_widget (self, GtkWidget* default_widget))
]

{ #category : 'private' }
GtkWindow >> setPosition: position [
	"This is how it will be positioned WHEN showing (not after)"

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkWindow >> show [
	"| titleBar |
	
	self withAllChildrenDo: #executeDeferredActions.
	self flag: #TODO. ""All this checking is because current TFFI does not answers correctly nil when 
	address answered is NULL. This will be fixed and this will not be necesary :)""
	titleBar := self titleBar.
	(titleBar notNil and: [ titleBar getHandle isNull not ]) 
		ifTrue: [ titleBar show ].
	super show"
	self deprecated: #Gtk4.
	self present
]

{ #category : 'accessing' }
GtkWindow >> showAll [
	"We have to do in this way to avoid the selection of the first element in a list"

	self 
		deprecated: 'Removed in Gtk4' 
		transformWith: 
			   '`@receiver showAll' 
			-> '`@receiver present'.
				
	self present
]

{ #category : 'geometry' }
GtkWindow >> size [
	
	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver size' -> '`@receiver defaultSize'.
		
	^ self defaultSize
]

{ #category : 'accessing' }
GtkWindow >> title [ 
	^ self ffiCall: #(const gchar *gtk_window_get_title (self))
]

{ #category : 'accessing' }
GtkWindow >> title: title [
	^ self ffiCall: #(void gtk_window_set_title (self, String title))
]

{ #category : 'accessing' }
GtkWindow >> titleBar [

	self ffiCall: #(GtkWidget *gtk_window_get_titlebar (self))
]

{ #category : 'accessing' }
GtkWindow >> titleBar: aTitleBar [

	self ffiCall: #(void gtk_window_set_titlebar (self, GtkWidget *aTitleBar))
]

{ #category : 'accessing' }
GtkWindow >> transientTo: parent [
	
	self ffiCall: #(void gtk_window_set_transient_for (self, GtkWindow *parent))
]

{ #category : 'private' }
GtkWindow >> unregister [

	"if this is the last window and I'm closing the app, it can happen than a destroy 
	 is called after the GtkApplication is disposed. I need to verify if is nil to avoid 
	 saving errors."
	self engine ifNotNil: [ :app | 
		app unregisterWindow: self ]
]

{ #category : 'private' }
GtkWindow >> windowAddAccelGroup: accel_group [

	self deprecated: #Gtk4
]

{ #category : 'finalization' }
GtkWindow >> windowDestroyed [
	"This process a destroy signal"

	GWindowDestroyAnnouncement emitWidget: self.

	self unregister.

	"according to documentation: Signals that all holders of a reference to the widget should
	 release the reference that they hold. May result in finalization of the widget if all
	 references are released.
	 Seems to mean if I receive the destroy signal, window no longer exist (and I do not need
	 to re-trigger destroy on it."
	handle beNull
]

{ #category : 'private' }
GtkWindow >> windowRemoveAccelGroup: accel_group [

	self deprecated: #Gtk4
]
