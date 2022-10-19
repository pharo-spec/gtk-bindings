"
GtkWidget — Base class for all widgets.

https://developer.gnome.org/gtk3/stable/GtkWidget.html
"
Class {
	#name : #GtkWidget,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'data',
		'deferActions',
		'eventControllers',
		'actionGroups'
	],
	#pools : [
		'GtkAccelFlags',
		'GtkAlign',
		'GtkStateFlags'
	],
	#category : #'Gtk-Widget'
}

{ #category : #accessing }
GtkWidget class >> bindingSet [
	"Binding set gives access to the bindings of a class. 
	 It is possible to use it to override the default keybindings defined. 
	 For example, this is how you map a context menu popup to <meta+t>: 
	
	 GtkTextView bindingSet
	 	addSignal: $t asciiValue 
	 	modifiers: GdkModifierType GDK_META_MASK
	 	signal: 'popup-menu'.
	"

	^ self gtkBindingSetByClass: self gClass
]

{ #category : #'library path' }
GtkWidget class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #finalization }
GtkWidget class >> finalizeResourceData: aHandle [

	super finalizeResourceData: aHandle
	"(self isValidHandle: aHandle) ifFalse: [ ^ self ].
	GtkFinalizeSignal emitTarget: self handle: aHandle.
	self widgetDestroy: aHandle"
]

{ #category : #'instance creation' }
GtkWidget class >> fromHandle: handle [
	^ (self basicNew setHandle: handle) initialize
]

{ #category : #accessing }
GtkWidget class >> gClassSize [
	"hardcoded. I took the size by executing sizeof in a C program"

	^ 824
]

{ #category : #accessing }
GtkWidget class >> gSize [

	^ 32
]

{ #category : #accessing }
GtkWidget class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_widget_get_type())
]

{ #category : #private }
GtkWidget class >> gtkBindingSetByClass: object_class [

	^ self ffiCall: #(GtkBindingSet *gtk_binding_set_by_class (gpointer object_class))
]

{ #category : #private }
GtkWidget class >> widgetDestroy: widget [
	"I get a handle here (a void *) so I need to remap the function"
	self ffiCall: #(void gtk_widget_destroy ("GtkWidget *" void *widget))
]

{ #category : #accessing }
GtkWidget >> addAccelerator: aString group: anAccelGroup shortcut: aShortcut [
	| charValue modifiers |

	charValue := aShortcut platformCharacter asciiValue.
	modifiers := aShortcut platformModifier asGdkModifierType.
		
	self 
		widgetAddAccelerator: aString 
		group: anAccelGroup 
		key: charValue
		modifiers: modifiers
		accelFlags: GTK_ACCEL_VISIBLE
		
]

{ #category : #style }
GtkWidget >> addClass: aString [

	self styleContext addClass: aString
]

{ #category : #'accessing - events' }
GtkWidget >> addClickEvent: aBlock [

	self addClickGestureWith: [ :gesture |
		gesture 
			named: 'click';
			beButtonPrimary;
			connectPressed: aBlock ]
]

{ #category : #'private - events' }
GtkWidget >> addClickGestureWith: aBlock [
	| gesture |
	
	"click gestures do not stack (they can be any kind, any button, etc.)"
	gesture := GtkGestureClick new 
		name: 'clicked';
		yourself.
	aBlock value: gesture.
	self addController: gesture		
]

{ #category : #'private - events' }
GtkWidget >> addController: controller [

	eventControllers ifNil: [ eventControllers := #() ].
	eventControllers := eventControllers copyWith: controller.
	
	"the widget will take control (see https://docs.gtk.org/gtk4/method.Widget.add_controller.html)"
	controller dontAutoRelease.
	
	self basicAddController: controller.
	^ controller
]

{ #category : #accessing }
GtkWidget >> addEvents: events [
	
	self ffiCall: #(void gtk_widget_add_events (self, gint events))
]

{ #category : #'private - events' }
GtkWidget >> addKeyEventControllerWith: aBlock [

	"key event controllers stack (I can stack key pressed and key released events)"
	aBlock value: (self 
		detectController: [ :each | each isKeyController ]  
		ifNone: [ self addController: GtkEventControllerKey new ])
]

{ #category : #'accessing - events' }
GtkWidget >> addKeyModifiersEvent: aBlock [
	"aBlock receives a GdkModifierType"

	self addKeyEventControllerWith: [ :keyController |
		keyController
			name: 'key-controller';
			connectModifiers: aBlock ]
]

{ #category : #'accessing - events' }
GtkWidget >> addKeyPressEvent: aBlock [
	"aBlock receives a GtkKeyEvent (an inner object, not existing in Gtk4)"

	self addKeyEventControllerWith: [ :keyController |
		keyController
			name: 'key-controller';
			connectKeyPressed: aBlock ]
]

{ #category : #'accessing - events' }
GtkWidget >> addKeyReleaseEvent: aBlock [

	self addKeyEventControllerWith: [ :keyController |
		keyController
			name: 'key-controller';
			connectKeyReleased: aBlock ]
]

{ #category : #'accessing - events' }
GtkWidget >> addRightClickEvent: aBlock [

	self addClickGestureWith: [ :gesture |
		gesture 
			named: 'right-click';
			beButtonSecondary;
			connectPressed: aBlock ]
]

{ #category : #accessing }
GtkWidget >> allocation [
	| allocation |
	
	allocation := GtkAllocation new.
	self getAllocation: allocation.
	^ allocation asRectangle
]

{ #category : #converting }
GtkWidget >> asListBoxRow [

	^ GtkListBoxRow newWidget: self
]

{ #category : #initialization }
GtkWidget >> autoObjectUnref [

	"do not unref"
]

{ #category : #'external resource management' }
GtkWidget >> autoRelease [

	GRegisterAutoReleaseAnnouncement emitWidget: self.
	^ super autoRelease
]

{ #category : #private }
GtkWidget >> basicAddController: controller [

	self ffiCall: #(void gtk_widget_add_controller (self, GtkEventController* controller))
]

{ #category : #private }
GtkWidget >> basicGrabDefault [

	self ffiCall: #(void gtk_widget_grab_default (self))
]

{ #category : #private }
GtkWidget >> basicInsertActionGroup: name actions: group [

	self ffiCall: #(void gtk_widget_insert_action_group (
		self, 
		char* name, 
		"GActionGroup*"GObject *group))
]

{ #category : #drawing }
GtkWidget >> boundingBox [

	self deprecated: #Gtk4.
	^ 0@0 corner: self size
]

{ #category : #private }
GtkWidget >> canDefault: can_default [

	self ffiCall: #(void gtk_widget_set_can_default (self, gboolean can_default))
]

{ #category : #private }
GtkWidget >> canFocus: can_focus [

	^ self ffiCall: #(void gtk_widget_set_can_focus (self, gboolean can_focus))
]

{ #category : #private }
GtkWidget >> cleanupAfterReplacing [
]

{ #category : #signaling }
GtkWidget >> connectButtonPressEvent: aBlock [
	"connects to button-press-event signal 
	 aBlock needs to answer a boolean to stop or not event propagation"

	self deprecated: 'Use a gesture now'
]

{ #category : #signaling }
GtkWidget >> connectButtonReleaseEvent: aBlock [
	"connects to button-release-event signal 
	 aBlock needs to answer a boolean to stop or not event propagation"

	self deprecated: 'Use a gesture now'
]

{ #category : #signaling }
GtkWidget >> connectClicked: aBlock [

	self deprecated: 'Use a gesture now'
]

{ #category : #signaling }
GtkWidget >> connectDeleteEvent: aBlock [
	"answers whether the widget can be deleted ot not"
	
	self deprecated: #Gtk
]

{ #category : #signaling }
GtkWidget >> connectDestroy: aBlock [

	(GDestroyCallback do: [ :widget :aData | aBlock value ]) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectDoubleClicked: aBlock [
	
	self deprecated: 'Use a gesture now'
]

{ #category : #signaling }
GtkWidget >> connectDragBegin: aBlock [

	(GDragBeginCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectDragEnd: aBlock [

	(GDragEndCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectEnterNotify: aBlock [
	"connects to motion_notify_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GEnterNotifyEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectEvent: aBlock [

	(GEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectEventAfter: aBlock [

	(GEventAfterCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectFocusInEvent: aBlock [
	
	(GFocusInEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectFocusOutEvent: aBlock [

	(GFocusOutEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectHide: aBlock [

	(GHideCallback do: [ :widget :user_data | aBlock value ]) connectTo: self 
]

{ #category : #signaling }
GtkWidget >> connectKeyPressEvent: aBlock [
 
	self deprecated: 'Gtk4: use a GtkEventControllerKey'
]

{ #category : #signaling }
GtkWidget >> connectKeyReleaseEvent: aBlock [

	self deprecated: 'Gtk4: use a GtkEventControllerKey'
]

{ #category : #signaling }
GtkWidget >> connectLeaveNotify: aBlock [
	"connects to motion_notify_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GLeaveNotifyEventCallback do: aBlock) connectTo: self

]

{ #category : #signaling }
GtkWidget >> connectMotionNotify: aBlock [
	"connects to motion_notify_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GMotionNotifyEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectNotifyProperty: property do: aBlock [

	(GNotifyPropertyCallback property: property do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectRealize: aBlock [

	^ self 
		connect: 'realize' 
		do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectRightClicked: aBlock [
	"connect to button-press-event signal but evaluates if this is 'secondary button', 
	 which is right click.
	 aBlock needs to answer a boolean to stop or not event propagation"
	
	(GSecondaryButtonPressEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectScroll: aBlock [
	"connects to scroll_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GScrollEventCallback do: aBlock) connectTo: self

]

{ #category : #signaling }
GtkWidget >> connectShow: aBlock [
	self connect: 'show' do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectSizeAllocate: aBlock [

	self deprecated: 'This is not valid in Gtk4'
]

{ #category : #signaling }
GtkWidget >> connectUnmap: aBlock [

	self 
		connect: 'unmap' 
		do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectWindowStateEvent: aBlock [

	self deprecated: #Gtk4
]

{ #category : #accessing }
GtkWidget >> contextMenu: aGtkMenu [
	"sets all needed to show a context menu. 
	 this is an extension to Gtk3, but it will make our lifes easier this side :).
	 It receives a valuable (usually a block)"

	self connectRightClicked: [ :event |
		aGtkMenu 
			showAll;
			popupAtPointer: event.
		false ]
]

{ #category : #'accessing - fonts' }
GtkWidget >> createPangoLayout: text [

	^ self ffiCall: #(PangoLayout *gtk_widget_create_pango_layout ( self, const gchar* text ))
]

{ #category : #accessing }
GtkWidget >> data [
	"Stores any kind of 'data' you want to keep associated to the widget"
	^ data
]

{ #category : #accessing }
GtkWidget >> data: anObject [
	data := anObject
]

{ #category : #'private - deferring' }
GtkWidget >> deferAction: aBlock [
	"Deferred actions are needed because some settings (like #grabDefault) acquire sense once a 
	 widget is inserted into a window. Hence, we need to 'defer' this action until that moment. 
	 NOTE: For now, because I didn't find a better place, resolution of deferred actions are made 
	 when calling GtkWindow>>#showAll, maybe this needs to change in the future.". 

	deferActions ifNil: [ deferActions := #() ].
	deferActions := deferActions copyWith: aBlock
]

{ #category : #initialization }
GtkWidget >> delete [

	self isAlive ifFalse: [ ^ self ].
	self destroy
]

{ #category : #accessing }
GtkWidget >> destroy [
	
	self deprecated: #Gtk4
]

{ #category : #'private - events' }
GtkWidget >> detectController: detectBlock ifNone: noneBlock [

	eventControllers ifNil: [ ^ noneBlock value ].
	^ eventControllers 
		detect: detectBlock
		ifNone: noneBlock
]

{ #category : #'private - events' }
GtkWidget >> detectControllerKind: aClass ifNone: aBlock [

	^ self 
		detectController: [ :each | each class = aClass ]
		ifNone: aBlock
]

{ #category : #private }
GtkWidget >> display [

	^ self ffiCall: #(GdkDisplay *gtk_widget_get_display (self))
]

{ #category : #private }
GtkWidget >> dragDestSetFlags: flags targetsTypes: targets targetsAmount: n_targets actions: actions [
"Sets a widget as a potential drop destination, and adds default behaviors.

The default behaviors listed in flags have an effect similar to installing default handlers for the widget’s drag-and-drop signals (“drag-motion”, “drag-drop”, ...). They all exist for convenience. When passing GTK_DEST_DEFAULT_ALL for instance it is sufficient to connect to the widget’s “drag-data-received” signal to get primitive, but consistent drag-and-drop support.

Things become more complicated when you try to preview the dragged data, as described in the documentation for “drag-motion”. The default behaviors described by flags make some assumptions, that can conflict with your own signal handlers. For instance GTK_DEST_DEFAULT_DROP causes invokations of gdk_drag_status() in the context of “drag-motion”, and invokations of gtk_drag_finish() in “drag-data-received”. Especially the later is dramatic, when your own “drag-motion” handler calls gtk_drag_get_data() to inspect the dragged data.

There’s no way to set a default action here, you can use the “drag-motion” callback for that. Here’s an example which selects the action to use depending on whether the control key is pressed or not:"
	^ self
		ffiCall:
			#(void gtk_drag_dest_set #(self , GtkDestDefaults flags , const GtkTargetEntry * targets , gint n_targets , GdkDragAction actions))
]

{ #category : #private }
GtkWidget >> dragDestUnset [
	"Clears information about a drop destination set with gtk_drag_dest_set(). The widget will no longer receive notification of drags."
	^ self ffiCall: #(void gtk_drag_dest_unset #(self))
]

{ #category : #accessing }
GtkWidget >> events [
	
	self ffiCall: #(gint gtk_widget_get_events (self))
]

{ #category : #accessing }
GtkWidget >> events: events [
	
	self ffiCall: #(void gtk_widget_set_events (self, gint events))
]

{ #category : #'private - deferring' }
GtkWidget >> executeDeferredActions [

	deferActions ifNil: [ ^ self ].
	deferActions do: #value.
	deferActions := nil
]

{ #category : #geometry }
GtkWidget >> expand: aBoolean [

	self hExpand: aBoolean.
	self vExpand: aBoolean
]

{ #category : #'library path' }
GtkWidget >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'accessing - fonts' }
GtkWidget >> fontMap: font_map [

	^ self ffiCall: #(void gtk_widget_set_font_map (self, PangoFontMap *font_map))
]

{ #category : #accessing }
GtkWidget >> gdkSurface [

	^ self ffiCall: #(GdkSurface *gtk_native_get_surface (self))
]

{ #category : #accessing }
GtkWidget >> gdkWindow [

	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver gdkWindow' -> '`@receiver gdkSurface'
]

{ #category : #private }
GtkWidget >> getAllocatedHeight [
	"Returns the height that has currently been allocated to widget . This function is intended to be used when implementing handlers for the “draw” function."

	^ self ffiCall: #(int gtk_widget_get_allocated_height(self))
]

{ #category : #private }
GtkWidget >> getAllocatedWidth [
	"Returns the width that has currently been allocated to widget . This function is intended to be used when implementing handlers for the “draw” function."

	^ self ffiCall: #(int gtk_widget_get_allocated_width(self))
]

{ #category : #private }
GtkWidget >> getAllocation: allocation [

	self ffiCall: #(void gtk_widget_get_allocation (self, GtkAllocation *allocation))
	
]

{ #category : #geometry }
GtkWidget >> getPreferredHeightTo: dest_minimum_height naturalTo: dest_natural_height [

	"Retrieves a widget’s initial minimum and natural height.

This call is specific to width-for-height requests.

The returned request will be modified by the GtkWidgetClass::adjust_size_request virtual method and by any GtkSizeGroups that have been applied. That is, the returned request is the one that should be used for layout, not necessarily the one returned by the widget itself."

	self ffiCall: #(void gtk_widget_get_preferred_height (
		self, 
		gint *dest_minimum_height,
		gint *dest_natural_height))
]

{ #category : #geometry }
GtkWidget >> getPreferredMinimalHeight [
		
	| result type minimumHeightBuffer naturalHeightBuffer |
	
	type := self class resolveType: 'gint'.
	minimumHeightBuffer := type newBuffer.
	naturalHeightBuffer := type newBuffer.
	
	result := self 
		getPreferredHeightTo: minimumHeightBuffer naturalTo: naturalHeightBuffer.
	
	^ minimumHeightBuffer signedLongAt: 1
]

{ #category : #geometry }
GtkWidget >> getPreferredMinimalWidth [
		
	| result type minimumWidthBuffer naturalWidthBuffer |
	
	type := self class resolveType: 'gint'.
	minimumWidthBuffer := type newBuffer.
	naturalWidthBuffer := type newBuffer.
	
	result := self 
		getPreferredWidthTo: minimumWidthBuffer naturalTo: naturalWidthBuffer.
	
	^ minimumWidthBuffer signedLongAt: 1
]

{ #category : #geometry }
GtkWidget >> getPreferredNaturalHeight [
		
	| result type minimumHeightBuffer naturalHeightBuffer |
	
	type := self class resolveType: 'gint'.
	minimumHeightBuffer := type newBuffer.
	naturalHeightBuffer := type newBuffer.
	
	result := self 
		getPreferredHeightTo: minimumHeightBuffer naturalTo: naturalHeightBuffer.
	
	^ naturalHeightBuffer signedLongAt: 1
]

{ #category : #geometry }
GtkWidget >> getPreferredNaturalWidth [
		
	| result type minimumWidthBuffer naturalWidthBuffer |
	
	type := self class resolveType: 'gint'.
	minimumWidthBuffer := type newBuffer.
	naturalWidthBuffer := type newBuffer.
	
	result := self 
		getPreferredWidthTo: minimumWidthBuffer naturalTo: naturalWidthBuffer.
	
	^ naturalWidthBuffer signedLongAt: 1
]

{ #category : #geometry }
GtkWidget >> getPreferredSizeMin: minimum_size natural: natural_size [

	self ffiCall: #(void gtk_widget_get_preferred_size (
		self, 
		GtkRequisition *minimum_size,
		GtkRequisition *natural_size))
]

{ #category : #geometry }
GtkWidget >> getPreferredWidthTo: dest_minimum_width naturalTo: dest_natural_width [

	"Retrieves a widget’s initial minimum and natural width.

This call is specific to height-for-width requests.

The returned request will be modified by the GtkWidgetClass::adjust_size_request virtual method and by any GtkSizeGroups that have been applied. That is, the returned request is the one that should be used for layout, not necessarily the one returned by the widget itself."

	self ffiCall: #(void gtk_widget_get_preferred_width(
		self, 
		gint *dest_minimum_width,
		gint *dest_natural_width))
]

{ #category : #private }
GtkWidget >> getTopLevel [
	"I will get the window from GtkApplication (to keep identity), so I answer just the 
	 ExternalAddress, skiping any other object creation."

	self deprecated: #Gtk4
]

{ #category : #private }
GtkWidget >> getWindow [
	"Returns the height that has currently been allocated to widget . This function is intended to be used when implementing handlers for the “draw” function."

	^ self
		ffiCall: #(GtkWindow *gtk_widget_get_window(self))
]

{ #category : #accessing }
GtkWidget >> grabDefault [

	self canDefault: true.
	self deferAction: [ 
		self basicGrabDefault ]
]

{ #category : #accessing }
GtkWidget >> grabFocus [
	self ffiCall: #(void gtk_widget_grab_focus (self))
]

{ #category : #geometry }
GtkWidget >> hAlign [
	^ self ffiCall: #(GtkAlign gtk_widget_get_halign (self))
]

{ #category : #geometry }
GtkWidget >> hAlign: align [
	^ self ffiCall: #(void gtk_widget_set_halign (self, GtkAlign align))
]

{ #category : #geometry }
GtkWidget >> hAlignCenter [

	self hAlign: GTK_ALIGN_CENTER
]

{ #category : #geometry }
GtkWidget >> hAlignEnd [

	self hAlign: GTK_ALIGN_END
]

{ #category : #geometry }
GtkWidget >> hAlignStart [

	self hAlign: GTK_ALIGN_START
]

{ #category : #geometry }
GtkWidget >> hExpand: expand [

	self ffiCall: #(void gtk_widget_set_hexpand (self, gboolean expand))
]

{ #category : #geometry }
GtkWidget >> height [

	^ self getAllocatedHeight
]

{ #category : #geometry }
GtkWidget >> height: aNumber [

	self sizeRequest: self width @ aNumber
]

{ #category : #showing }
GtkWidget >> hide [

	self ffiCall: #(void gtk_widget_hide (self))
]

{ #category : #accessing }
GtkWidget >> insertActionGroup: name actions: group [

	actionGroups ifNil: [ actionGroups := #() ].
	actionGroups := actionGroups copyWith: group.
	self basicInsertActionGroup: name actions: group
]

{ #category : #testing }
GtkWidget >> isBin [

	^ false
]

{ #category : #testing }
GtkWidget >> isConfiguredVisible [
	^ self ffiCall: #(gboolean gtk_widget_get_visible (self))
]

{ #category : #testing }
GtkWidget >> isContainer [

	^ false
]

{ #category : #testing }
GtkWidget >> isFocus [
	^ self ffiCall: #(gboolean gtk_widget_is_focus (self))
]

{ #category : #testing }
GtkWidget >> isHExpand [

	self ffiCall: #(gboolean gtk_widget_get_hexpand (self))
]

{ #category : #testing }
GtkWidget >> isSensitive [
	"Returns the widget’s effective sensitivity, which means it is sensitive itself and also its parent widget is sensitive"

	^ self ffiCall: #(gboolean gtk_widget_is_sensitive (self))
]

{ #category : #testing }
GtkWidget >> isVExpand [

	self ffiCall: #(gboolean gtk_widget_get_vexpand (self))
]

{ #category : #testing }
GtkWidget >> isVisible [
	^ self ffiCall: #(gboolean gtk_widget_is_visible (self))
]

{ #category : #accessing }
GtkWidget >> layoutManager [

	^ self ffiCall: #(GtkLayoutManager* gtk_widget_get_layout_manager (self))
]

{ #category : #accessing }
GtkWidget >> layoutManager: layout_manager [

	self ffiCall: #(void gtk_widget_set_layout_manager (self, GtkLayoutManager* layout_manager))
]

{ #category : #geometry }
GtkWidget >> margin [

	self deprecated: 'Gtk4. Use margin* methods.'.

	^ 0
]

{ #category : #geometry }
GtkWidget >> margin: aNumber [

	self marginTop: aNumber.	
	self marginStart: aNumber.
	self marginBottom: aNumber.	
	self marginEnd: aNumber
	
]

{ #category : #geometry }
GtkWidget >> marginBottom [

	^ self ffiCall: #(gint gtk_widget_get_margin_bottom (self))
]

{ #category : #geometry }
GtkWidget >> marginBottom: margin [

	self ffiCall: #(void gtk_widget_set_margin_bottom (self, gint margin))
]

{ #category : #geometry }
GtkWidget >> marginEnd [

	^ self ffiCall: #(gint gtk_widget_get_margin_end (self))
]

{ #category : #geometry }
GtkWidget >> marginEnd: margin [

	self ffiCall: #(void gtk_widget_set_margin_end (self, gint margin))
]

{ #category : #geometry }
GtkWidget >> marginStart [

	^ self ffiCall: #(gint gtk_widget_get_margin_start (self))
]

{ #category : #geometry }
GtkWidget >> marginStart: margin [

	self ffiCall: #(void gtk_widget_set_margin_start (self, gint margin))
]

{ #category : #geometry }
GtkWidget >> marginTop [

	^ self ffiCall: #(gint gtk_widget_get_margin_top (self))
]

{ #category : #geometry }
GtkWidget >> marginTop: margin [

	self ffiCall: #(void gtk_widget_set_margin_top (self, gint margin))
]

{ #category : #'accessing - fonts' }
GtkWidget >> pangoContext [

	^ self ffiCall: #(PangoContext *gtk_widget_get_pango_context (self))
]

{ #category : #accessing }
GtkWidget >> parent [

	^ self ffiCall: #(GtkWidget* gtk_widget_get_parent (self))
]

{ #category : #accessing }
GtkWidget >> parent: parent [

	self ffiCall: #(void gtk_widget_set_parent (self, GtkWidget* parent))
]

{ #category : #accessing }
GtkWidget >> parentWindow [ 
	| windowHandle |
	
	windowHandle := self getTopLevel.
	windowHandle isNull ifTrue: [ ^ nil ].
	
	^ GtkEngine current windowByHandle: windowHandle
]

{ #category : #accessing }
GtkWidget >> path [
	| length path pathReversed |
	
	length := ExternalAddress new.
	path := ExternalAddress new.
	pathReversed := ExternalAddress new.
	
	self widgetPathLength: length path: path reversed: pathReversed.
	
	^ path readString
]

{ #category : #drawing }
GtkWidget >> positionInTopLevel [

	self deprecated: #Gtk4.
	
	^ 0@0
]

{ #category : #geometry }
GtkWidget >> preferredSizeMinimum [
	| min natural |
	
	min := GtkRequisition new.
	natural := GtkRequisition new.
	self 
		getPreferredSizeMin: min 
		natural: natural.
	
	^ min width @ min height
]

{ #category : #geometry }
GtkWidget >> preferredSizeNatural [
	| min natural |
	
	min := GtkRequisition new.
	natural := GtkRequisition new.
	self 
		getPreferredSizeMin: min 
		natural: natural.
	
	^ natural width @ natural height
]

{ #category : #geometry }
GtkWidget >> privGetPreferredWidth [

	self ffiCall: #(void gtk_widget_get_preferred_width (
		self, 
		gint *minimum_width,
		gint natural_width))
]

{ #category : #accessing }
GtkWidget >> queueDraw [

	^ GtkQueueDraw uniqueInstance queueDraw: self
]

{ #category : #accessing }
GtkWidget >> queueDrawArea: rect [

	^ GtkQueueDraw uniqueInstance 
		queueDrawArea: self
		x: rect left asInteger
		y: rect top asInteger
		width: rect width asInteger
		height: rect height asInteger
]

{ #category : #accessing }
GtkWidget >> queueResize [

	^ self ffiCall: #(void gtk_widget_queue_resize (self))
]

{ #category : #accessing }
GtkWidget >> queueResizeNoRedraw [

	^ self ffiCall: #(void gtk_widget_queue_resize_no_redraw (self))
]

{ #category : #style }
GtkWidget >> removeClass: aString [

	self styleContext removeClass: aString
]

{ #category : #'external resource management' }
GtkWidget >> resourceData [
	^ handle
]

{ #category : #geometry }
GtkWidget >> scaleFactor [
	"See https://developer.gnome.org/gtk3/stable/GtkWidget.html#gtk-widget-get-scale-factor"

	^ self ffiCall: #(gint gtk_widget_get_scale_factor (self))
]

{ #category : #accessing }
GtkWidget >> sensitive [
	
	^ self ffiCall: #(gboolean gtk_widget_get_sensitive (self))
]

{ #category : #accessing }
GtkWidget >> sensitive: sensitive [
	"sensitive is the gtk equivallent of enable/disable"

	self ffiCall: #(void gtk_widget_set_sensitive (self, gboolean sensitive))
]

{ #category : #accessing }
GtkWidget >> setSizeRequestWidth: width height: height [
	
	self
		ffiCall: #(void gtk_widget_set_size_request #(self , gint width , gint height))
]

{ #category : #private }
GtkWidget >> setTooltipText: text [

	^ self ffiCall: #(void gtk_widget_set_tooltip_text (self, const gchar *text))
]

{ #category : #showing }
GtkWidget >> show [

	^ self ffiCall: #(void gtk_widget_show (self))
]

{ #category : #showing }
GtkWidget >> showAll [

	self deprecated: 'Removed in Gtk4'
]

{ #category : #geometry }
GtkWidget >> size [

	^  self width @ self height
]

{ #category : #geometry }
GtkWidget >> sizeAllocate: aRect [

	self widgetSizeAllocate: aRect asGtkAllocation
]

{ #category : #geometry }
GtkWidget >> sizeRequest: aPoint [

	self 
		sizeRequestWidth: aPoint x asInteger 
		height: aPoint y asInteger
]

{ #category : #private }
GtkWidget >> sizeRequestWidth: width height: height [
	^ self ffiCall: #(void gtk_widget_set_size_request ( self, gint width, gint height ) )
]

{ #category : #style }
GtkWidget >> styleContext [
	
	^ self ffiCall: #(GtkStyleContext *gtk_widget_get_style_context (self))
]

{ #category : #accessing }
GtkWidget >> tooltipText [
	
	^ self ffiCall: #(String gtk_widget_get_tooltip_text (self))
]

{ #category : #accessing }
GtkWidget >> tooltipText: aString [

	self setTooltipText: aString
]

{ #category : #accessing }
GtkWidget >> translateCoordinates: aPoint to: aWidget [
	| result type xBuffer yBuffer |
	
	type := self class resolveType: 'gint'.
	xBuffer := type newBuffer.
	yBuffer := type newBuffer.
	
	result := self 
		translateCoordinatesTo: aWidget 
		x: aPoint x 
		y: aPoint y 
		toX: xBuffer 
		toY: yBuffer.
	
	^ result 
		ifTrue: [ (xBuffer signedLongAt: 1) @ (yBuffer signedLongAt: 1) ]
		ifFalse: [ aPoint ]
]

{ #category : #accessing }
GtkWidget >> translateCoordinatesTo: dest_widget x: src_x y: src_y toX: dest_x toY: dest_y [
	
	^ self ffiCall: #(gboolean gtk_widget_translate_coordinates (
		self,
		GtkWidget *dest_widget,
		gint src_x,
		gint src_y,
 		gint *dest_x,
 		gint *dest_y))
]

{ #category : #accessing }
GtkWidget >> unparent [

	^ self ffiCall: #(void gtk_widget_unparent (self))
]

{ #category : #geometry }
GtkWidget >> vAlign [
	^ self ffiCall: #(GtkAlign gtk_widget_get_valign (self))
]

{ #category : #geometry }
GtkWidget >> vAlign: align [
	^ self ffiCall: #(void gtk_widget_set_valign (self, GtkAlign align))
]

{ #category : #geometry }
GtkWidget >> vAlignCenter [

	self vAlign: GTK_ALIGN_CENTER
]

{ #category : #geometry }
GtkWidget >> vAlignEnd [

	self vAlign: GTK_ALIGN_END
]

{ #category : #geometry }
GtkWidget >> vAlignStart [

	self vAlign: GTK_ALIGN_START
]

{ #category : #geometry }
GtkWidget >> vExpand: expand [

	self ffiCall: #(void gtk_widget_set_vexpand (self, gboolean expand))
]

{ #category : #private }
GtkWidget >> widgetAddAccelerator: accel_signal group: accel_group key: accel_key modifiers: accel_mods accelFlags: accel_flags [

	^ self ffiCall: #(void gtk_widget_add_accelerator (
		self,
 		const gchar *accel_signal,
		GtkAccelGroup *accel_group,
		guint accel_key,
		GdkModifierType accel_mods,
		GtkAccelFlags accel_flags))
]

{ #category : #private }
GtkWidget >> widgetPathLength: path_length path: path reversed: path_reversed [
	^ self ffiCall: #(void gtk_widget_path (self, guint *path_length, gchar **path, gchar **path_reversed))
]

{ #category : #private }
GtkWidget >> widgetSizeAllocate: allocation [

	self ffiCall: #(void gtk_widget_size_allocate (self, GtkAllocation *allocation))
	
]

{ #category : #geometry }
GtkWidget >> width [

	^ self getAllocatedWidth
]

{ #category : #geometry }
GtkWidget >> width: aNumber [

	self sizeRequest: aNumber @ self height
]

{ #category : #'private - deferring' }
GtkWidget >> withAllChildrenDo: aBlock [

	aBlock cull: self
]
