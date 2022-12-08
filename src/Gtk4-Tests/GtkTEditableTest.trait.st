Trait {
	#name : #GtkTEditableTest,
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #tests }
GtkTEditableTest >> testEditable [

	self assert: self widget isEditable.
	self widget editable: false.
	self deny: self widget isEditable
]

{ #category : #tests }
GtkTEditableTest >> testText [

	self widget text: 'Test'.
	self 
		assert: self widget text
		equals: 'Test'
]
