"
GdkDisplay
GdkDisplay — Controls a set of GdkScreens and their associated input devices

https://developer.gnome.org/gdk3/stable/GdkDisplay.html
"
Class {
	#name : 'GdkDisplay',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gdk-Base',
	#package : 'Gdk',
	#tag : 'Base'
}

{ #category : 'instance creation' }
GdkDisplay class >> default [ 

	"do not send #initialize here because we do not need it (and keeping a reference 
	 is useless since this is kept in Gtk3."
	^ self getDefault "initialize" 
]

{ #category : 'accessing' }
GdkDisplay class >> forceRectangleToFitLimits: aRect [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GdkDisplay class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_display_get_type())
]

{ #category : 'private' }
GdkDisplay class >> getDefault [

	^ self ffiCall: #(GdkDisplay *gdk_display_get_default (void))
]

{ #category : 'accessing' }
GdkDisplay >> clipboard [

	^ self ffiCall: #(GdkClipboard* gdk_display_get_clipboard (self))
]

{ #category : 'accessing' }
GdkDisplay >> defaultSeat [ 

	^ GdkSeat defaultForDisplay: self
]

{ #category : 'accessing' }
GdkDisplay >> deviceIsGrabbed: aGdkDevice [

	^ self ffiCall: #(gboolean gdk_display_device_is_grabbed (
		self,
		GdkDevice *aGdkDevice))
]

{ #category : 'accessing' }
GdkDisplay >> flush [

	self ffiCall: #(void gdk_display_flush (self))
]

{ #category : 'accessing' }
GdkDisplay >> forceReleaseDestroyedDeviceGrabs [
	"Release stale grab entries whose top grab surface was already destroyed."
	| seat released |
	
	seat := self defaultSeat.
	seat isNullOrNil ifTrue: [ ^ false ].
	
	released := false.
	
	{ seat pointer. seat keyboard } 
		do: [ :each |
			[ released := (self releaseDestroyedGrabForDevice: each) or: [ released ] ]
				on: Error
				do: [ :e | 
					"eat it... maybe not the best"
					logger error: e ] ].

	^ released
]

{ #category : 'private' }
GdkDisplay >> gHashTableLookup: tableHandle key: keyHandle [

	^ self ffiCall: #( void #* g_hash_table_lookup #( void #* tableHandle #, gpointer keyHandle ) ) module: GLibLibrary
]

{ #category : 'private' }
GdkDisplay >> gHashTableSteal: tableHandle key: keyHandle [

	^ self ffiCall: #( gboolean g_hash_table_steal #( void #* tableHandle #, gpointer keyHandle ) ) module: GLibLibrary
]

{ #category : 'private' }
GdkDisplay >> gListFreeOne: listHandle [

	self ffiCall: #( void g_list_free_1 #( void #* listHandle ) ) module: GLibLibrary
]

{ #category : 'private' }
GdkDisplay >> gListLast: listHandle [

	^ self ffiCall: #( void #* g_list_last #( void #* listHandle ) ) module: GLibLibrary
]

{ #category : 'private' }
GdkDisplay >> grabListForDevice: aGdkDevice [
	| tableHandle deviceHandle |
	
	tableHandle := self grabTableHandle.
	tableHandle isNullOrNil ifTrue: [ ^ ExternalAddress null ].
	
	aGdkDevice isNullOrNil ifTrue: [ ^ ExternalAddress null ].
	deviceHandle := aGdkDevice getHandle.
	
	deviceHandle isNullOrNil ifTrue: [ ^ ExternalAddress null ].

	^ self gHashTableLookup: tableHandle key: deviceHandle
]

{ #category : 'private' }
GdkDisplay >> grabSurfaceForDevice: aGdkDevice [
	| lastLink grabInfoHandle surfaceHandle |
	
	lastLink := self topGrabListLinkForDevice: aGdkDevice.
	lastLink isNullOrNil ifTrue: [ ^ GdkSurface null ].
	
	grabInfoHandle := lastLink pointerAt: 1.
	grabInfoHandle isNullOrNil ifTrue: [ ^ GdkSurface null ].
	
	surfaceHandle := grabInfoHandle pointerAt: 1.
	surfaceHandle isNullOrNil ifTrue: [ ^ GdkSurface null ].

	^ GdkSurface fromHandleUnowned: surfaceHandle
]

{ #category : 'private' }
GdkDisplay >> grabTableHandle [
	| displayHandle |
	
	displayHandle := self getHandle.
	displayHandle isNullOrNil  ifTrue: [ ^ ExternalAddress null ].

	^ displayHandle + 16r38 pointerAt: 1
]

{ #category : 'accessing' }
GdkDisplay >> monitorAt: aNumber [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GdkDisplay >> monitors [

	^ self ffiCall: #(GListModel *gdk_display_get_monitors (self))
]

{ #category : 'accessing' }
GdkDisplay >> primaryClipboard [

	^ self ffiCall: #(GdkClipboard *gdk_display_get_primary_clipboard (self))
]

{ #category : 'accessing' }
GdkDisplay >> primaryMonitor [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GdkDisplay >> releaseDestroyedGrabForDevice: aGdkDevice [
	| tableHandle deviceHandle listHandle lastLink grabInfoHandle surfaceHandle surface previousLink removed |
	
	self flag: #HACK. "mega-hack in non-public API, which means this can change and break everything.
	NOBODY should use this. Heck, not even me... but I am trying to fix some bugs..."
	
	aGdkDevice isNullOrNil ifTrue: [ ^ false ].
	
	(self deviceIsGrabbed: aGdkDevice) ifFalse: [ ^ false ].

	tableHandle := self grabTableHandle.
	tableHandle isNullOrNil ifTrue: [ ^ false ].
	
	deviceHandle := aGdkDevice getHandle.
	deviceHandle isNullOrNil ifTrue: [ ^ false ].
	
	listHandle := self gHashTableLookup: tableHandle key: deviceHandle.
	listHandle isNullOrNil ifTrue: [ ^ false ].
	
	lastLink := self gListLast: listHandle.
	lastLink isNullOrNil ifTrue: [ ^ false ].
	
	grabInfoHandle := lastLink pointerAt: 1.
	grabInfoHandle isNullOrNil ifTrue: [ ^ false ].
	
	surfaceHandle := grabInfoHandle pointerAt: 1.
	surfaceHandle isNullOrNil ifTrue: [ ^ false ].
	
	surface := GdkSurface fromHandleUnowned: surfaceHandle.
	(surface isNullOrNil not and: [ surface isDestroyed ]) ifFalse: [ ^ false ].

	previousLink := lastLink pointerAt: ExternalAddress wordSize * 2 + 1.
	previousLink isNullOrNil
		ifTrue: [
			removed := self gHashTableSteal: tableHandle key: deviceHandle.
			removed ifFalse: [ ^ false ] ]
		ifFalse: [
			previousLink pointerAt: ExternalAddress wordSize + 1 put: ExternalAddress null.
			removed := true ].

	self gListFreeOne: lastLink.
	
	"check"
	(self deviceIsGrabbed: aGdkDevice)
		ifTrue: [ logger debug: 'Destroyed GDK grab entry removed; device remains grabbed' ]
		ifFalse: [ logger debug: 'Destroyed GDK grab entry removed; device no longer grabbed' ].

	^ removed
]

{ #category : 'private' }
GdkDisplay >> topGrabListLinkForDevice: aGdkDevice [
	| listHandle |
	
	aGdkDevice isNullOrNil ifTrue: [ ^ ExternalAddress null ].
	(self deviceIsGrabbed: aGdkDevice) ifFalse: [ ^ ExternalAddress null ].
	
	listHandle := self grabListForDevice: aGdkDevice.
	listHandle isNullOrNil ifTrue: [ ^ ExternalAddress null ].

	^ self gListLast: listHandle
]
