"
GtkIMContext — Base class for input method contexts

https://developer.gnome.org/gtk3/stable/GtkIMContext.html
"
Class {
	#name : #GtkIMContext,
	#superclass : #GObject,
	#category : #'Gtk-Misc'
}

{ #category : #'instance creation' }
GtkIMContext class >> im_context_simple_new [

	^ self ffiCall: #(GtkIMContext *gtk_im_context_simple_new (void))
]

{ #category : #'instance creation' }
GtkIMContext class >> im_module_create: context_id [

	^ self ffiCall: #(GtkIMContext *im_module_create(const gchar *context_id))
]

{ #category : #'instance creation' }
GtkIMContext class >> newDefault [

	^ self newModule: (GtkSettings default gObjectGetString: 'gtk-im-module')
]

{ #category : #'instance creation' }
GtkIMContext class >> newModule: aName [

	^ (self im_module_create: aName) initialize
]

{ #category : #'instance creation' }
GtkIMContext class >> newSimple [

	^ self im_context_simple_new initialize
]

{ #category : #signaling }
GtkIMContext >> connectCommit: aBlock [

	^ self 
		connect: 'commit' 
		signature: #(void (void *context, char *str, gpointer data)) 
		do: [ :context :str :data | 
			aBlock value: str ]
]

{ #category : #accessing }
GtkIMContext >> filterKeypress: event [

	^ self ffiCall: #(gboolean gtk_im_context_filter_keypress (self, GdkEventKey *event))
]

{ #category : #initialization }
GtkIMContext >> reset [

	^ self ffiCall: #(void gtk_im_context_reset (self))
]
