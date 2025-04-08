Trait {
	#name : 'GtkTToggleableButton',
	#category : 'Gtk-Widget-Buttons',
	#package : 'Gtk',
	#tag : 'Widget-Buttons'
}

{ #category : 'accessing' }
GtkTToggleableButton >> active: aBoolean [

	self shouldBeImplemented
]

{ #category : 'accessing' }
GtkTToggleableButton >> beActive [

	self active: true
]

{ #category : 'accessing' }
GtkTToggleableButton >> beNonActive [

	self active: false
]

{ #category : 'signaling' }
GtkTToggleableButton >> connectActivate: aBlock [

	(GActivateCallback do: aBlock) connectTo: self
]

{ #category : 'signaling' }
GtkTToggleableButton >> connectToggled: aBlock [

	(GToggledCallback do: aBlock) connectTo: self
]
