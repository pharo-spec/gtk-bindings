"
https://www.cs.tut.fi/lintula/manual/gtk/gtk/gtk-drag-and-drop.html#GTKTARGETFLAGS

The GtkTargetFlags enumeration is used to specifies constraints on an entry in a GtkTargetTable.

GTK_TARGET_SAME_APP
If this is set, the target will only be selected for drags within a single application.

GTK_TARGET_SAME_WIDGET
If this is set, the target will only be selected for drags within a single widget.


"
Class {
	#name : 'GtkTargetFlags',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_TARGET_OTHER_APP',
		'GTK_TARGET_OTHER_WIDGET',
		'GTK_TARGET_SAME_APP',
		'GTK_TARGET_SAME_WIDGET'
	],
	#category : 'Gtk-Widget',
	#package : 'Gtk',
	#tag : 'Widget'
}

{ #category : 'accessing enum' }
GtkTargetFlags class >> GTK_TARGET_OTHER_APP [
	"This method was automatically generated"
	^ GTK_TARGET_OTHER_APP
]

{ #category : 'accessing enum' }
GtkTargetFlags class >> GTK_TARGET_OTHER_WIDGET [
	"This method was automatically generated"
	^ GTK_TARGET_OTHER_WIDGET
]

{ #category : 'accessing enum' }
GtkTargetFlags class >> GTK_TARGET_SAME_APP [
	"This method was automatically generated"
	^ GTK_TARGET_SAME_APP
]

{ #category : 'accessing enum' }
GtkTargetFlags class >> GTK_TARGET_SAME_WIDGET [
	"This method was automatically generated"
	^ GTK_TARGET_SAME_WIDGET
]

{ #category : 'enum declaration' }
GtkTargetFlags class >> enumDecl [
	"self initializeEnumeration"
	^ {
  	#GTK_TARGET_SAME_APP . 1 << 0.
  	#GTK_TARGET_SAME_WIDGET  . 1 << 1.
	#GTK_TARGET_OTHER_APP . 1 << 2.
	#GTK_TARGET_OTHER_WIDGET . 1 << 3.
}
 
]
