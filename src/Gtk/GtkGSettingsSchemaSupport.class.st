"
In some platforms I need to include a file, gschema.compiled to be able to execute some dependencies (notably, the GtkFileDialog save/selectFolder functions).  
This is usually deep in the system (linux, or other) but in windows or macOS we put it along with 
the libraries. 
To let GTK find it, we need to set `GSETTINGS_SCHEMA_DIR` environment variable to point to the directory where the file is. 

The settings support need to ne executed BEFORE any engine initialization, hence `shouldRunBeforeEngineInitialization` will answer true.
"
Class {
	#name : 'GtkGSettingsSchemaSupport',
	#superclass : 'GtkEngineSupport',
	#category : 'Gtk-Application',
	#package : 'Gtk',
	#tag : 'Application'
}

{ #category : 'testing' }
GtkGSettingsSchemaSupport class >> isAvailable [

	^  true
]

{ #category : 'testing' }
GtkGSettingsSchemaSupport class >> shouldRunBeforeEngineInitialization [

	^ true
]

{ #category : 'accessing' }
GtkGSettingsSchemaSupport >> start [

	OSPlatform current accept: self
]

{ #category : 'visiting' }
GtkGSettingsSchemaSupport >> visitMacOSX: aPlatform [

	OSEnvironment current 
		at: #GSETTINGS_SCHEMA_DIR
		put: FileLocator vmDirectory fullName
]

{ #category : 'visiting' }
GtkGSettingsSchemaSupport >> visitUnix64: aPlatform [
]

{ #category : 'visiting' }
GtkGSettingsSchemaSupport >> visitWindows64: aPlatform [

	OSEnvironment current 
		at: #GDK_DISABLE put: 'gl';
		at: #GSETTINGS_SCHEMA_DIR put: FileLocator vmDirectory fullName
]
