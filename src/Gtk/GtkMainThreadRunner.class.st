Class {
	#name : 'GtkMainThreadRunner',
	#superclass : 'TFMainThreadRunner',
	#category : 'Gtk-App-Experimental',
	#package : 'Gtk',
	#tag : 'App-Experimental'
}

{ #category : 'executing' }
GtkMainThreadRunner >> invokeFunction: function withArguments: aCollection [

	logger trace: function functionName. 

	^ super 
		invokeFunction: function 
		withArguments: aCollection
]
