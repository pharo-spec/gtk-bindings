"
I'm a  tabbed notebook container.

https://developer.gnome.org/gtk3/stable/GtkNotebook.html
"
Class {
	#name : #GtkNotebook,
	#superclass : #GtkContainer,
	#traits : 'GtkTContainer',
	#classTraits : 'GtkTContainer classTrait',
	#pools : [
		'GtkOrientation'
	],
	#category : #'Gtk-Widget-Container'
}

{ #category : #accessing }
GtkNotebook class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_notebook_get_type())
]

{ #category : #'instance creation' }
GtkNotebook class >> new [
	^ self notebookNew initialize 
]

{ #category : #private }
GtkNotebook class >> notebookNew [
	^ self ffiCall: #(GtkNotebook *gtk_notebook_new (void))
]

{ #category : #accessing }
GtkNotebook >> append: aPage [

	self keepWidget: aPage.
	self basicAdd: aPage
]

{ #category : #accessing }
GtkNotebook >> append: child label: label [
	| page |

	page := self newPageLabel: label content: child.
	self append: page
]

{ #category : #private }
GtkNotebook >> appendPageChild: child label: tab_label [

	^ self ffiCall: #(gint gtk_notebook_append_page (self, GtkWidget *child, GtkWidget *tab_label))
]

{ #category : #private }
GtkNotebook >> basicAdd: aPage [

	self 
		appendPageChild: aPage content
		label: aPage label
]

{ #category : #private }
GtkNotebook >> basicRemove: aPage [
 
	self removePageIndex: aPage zIndex
]

{ #category : #accessing }
GtkNotebook >> beNotScrollable [

	self scrollable: false
]

{ #category : #accessing }
GtkNotebook >> beScrollable [

	self scrollable: true
]

{ #category : #signals }
GtkNotebook >> connectSwitchPage: aBlock [
	"triggers when a page has been switched (by user or program).
	 aBlock receives the index of the switched page"

	(GtkSwitchPageCallback 
		do: [ :pageNum | aBlock value: (self children at: pageNum) ])
		connectTo: self
]

{ #category : #accessing }
GtkNotebook >> currentPage [

	^ self ffiCall: #(gint gtk_notebook_get_current_page (self))
]

{ #category : #accessing }
GtkNotebook >> currentPage: page_num [

	^ self ffiCall: #(void gtk_notebook_set_current_page (self, gint page_num))
	
]

{ #category : #initialization }
GtkNotebook >> initialize [

	super initialize.
	self initializeTContainer
]

{ #category : #testing }
GtkNotebook >> isScrollable [

	^ self ffiCall: #(gboolean gtk_notebook_get_scrollable (self))
]

{ #category : #factory }
GtkNotebook >> newPageLabel: labelWidget content: pageWidget [

	^ GtkNotebookPage 
		newNotebook: self
		label: labelWidget
		content: pageWidget
]

{ #category : #accessing }
GtkNotebook >> pageWithData: anObject [
	"utility to find child with associated data (useful to map operations)"
	
	^ self 
		pageWithData: anObject 
		ifNone: [ NotFound signalFor: anObject ]
]

{ #category : #accessing }
GtkNotebook >> pageWithData: anObject ifNone: aBlock [
	"utility to find child with associated data (useful to map operations)"
	
	^ self children 
		detect: [ :each | each data = anObject ]
		ifNone: aBlock
]

{ #category : #private }
GtkNotebook >> removePageIndex: page_num [
	
	self ffiCall: #(void gtk_notebook_remove_page (self, gint page_num))
]

{ #category : #private }
GtkNotebook >> scrollable: scrollable [

	self ffiCall: #(void gtk_notebook_set_scrollable (self, gboolean scrollable))
]
