"
Specifies the state of a toplevel surface.

https://docs.gtk.org/gdk4/flags.ToplevelState.html
"
Class {
	#name : 'GdkTopLevelState',
	#superclass : 'GEnumeration',
	#classVars : [
		'GDK_TOPLEVEL_STATE_ABOVE',
		'GDK_TOPLEVEL_STATE_BELOW',
		'GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE',
		'GDK_TOPLEVEL_STATE_BOTTOM_TILED',
		'GDK_TOPLEVEL_STATE_FOCUSED',
		'GDK_TOPLEVEL_STATE_FULLSCREEN',
		'GDK_TOPLEVEL_STATE_LEFT_RESIZABLE',
		'GDK_TOPLEVEL_STATE_LEFT_TILED',
		'GDK_TOPLEVEL_STATE_MAXIMIZED',
		'GDK_TOPLEVEL_STATE_MINIMIZED',
		'GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE',
		'GDK_TOPLEVEL_STATE_RIGHT_TILED',
		'GDK_TOPLEVEL_STATE_STICKY',
		'GDK_TOPLEVEL_STATE_TILED',
		'GDK_TOPLEVEL_STATE_TOP_RESIZABLE',
		'GDK_TOPLEVEL_STATE_TOP_TILED'
	],
	#category : 'Gdk-Base',
	#package : 'Gdk',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_ABOVE [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_ABOVE
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_BELOW [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_BELOW
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_BOTTOM_TILED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_BOTTOM_TILED
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_FOCUSED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_FOCUSED
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_FULLSCREEN [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_FULLSCREEN
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_LEFT_RESIZABLE [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_LEFT_RESIZABLE
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_LEFT_TILED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_LEFT_TILED
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_MAXIMIZED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_MAXIMIZED
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_MINIMIZED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_MINIMIZED
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_RIGHT_TILED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_RIGHT_TILED
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_STICKY [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_STICKY
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_TILED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_TILED
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_TOP_RESIZABLE [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_TOP_RESIZABLE
]

{ #category : 'accessing enum' }
GdkTopLevelState class >> GDK_TOPLEVEL_STATE_TOP_TILED [
	"This method was automatically generated"
	^ GDK_TOPLEVEL_STATE_TOP_TILED
]

{ #category : 'enum declaration' }
GdkTopLevelState class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"

	^ { 
	#GDK_TOPLEVEL_STATE_MINIMIZED. 1 << 0.
	#GDK_TOPLEVEL_STATE_MAXIMIZED. 1 << 1.
	#GDK_TOPLEVEL_STATE_STICKY. 1 << 2.
	#GDK_TOPLEVEL_STATE_FULLSCREEN. 1 << 3.
	#GDK_TOPLEVEL_STATE_ABOVE. 1 << 4.
	#GDK_TOPLEVEL_STATE_BELOW. 1 << 5.
	#GDK_TOPLEVEL_STATE_FOCUSED. 1 << 6.
	#GDK_TOPLEVEL_STATE_TILED. 1 << 7.
	#GDK_TOPLEVEL_STATE_TOP_TILED. 1 << 8.
	#GDK_TOPLEVEL_STATE_TOP_RESIZABLE. 1 << 9.
	#GDK_TOPLEVEL_STATE_RIGHT_TILED. 1 << 10.
	#GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE. 1 << 11.
	#GDK_TOPLEVEL_STATE_BOTTOM_TILED. 1 << 12.
	#GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE. 1 << 13.
	#GDK_TOPLEVEL_STATE_LEFT_TILED. 1 << 14.
	#GDK_TOPLEVEL_STATE_LEFT_RESIZABLE. 1 << 15 
	}
]

{ #category : 'testing' }
GdkTopLevelState >> isMinimized [

	^ (self & GDK_TOPLEVEL_STATE_MINIMIZED) = GDK_TOPLEVEL_STATE_MINIMIZED
]
