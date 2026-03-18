Class {
	#name : 'GtkSameThreadRunner',
	#superclass : 'TFSameThreadRunner',
	#category : 'Gtk-App-Experimental',
	#package : 'Gtk',
	#tag : 'App-Experimental'
}

{ #category : 'executing' }
GtkSameThreadRunner >> invokeFunction: function withArguments: aCollection [

	logger trace: function functionName. 

	^ super 
		invokeFunction: function 
		withArguments: aCollection
]
