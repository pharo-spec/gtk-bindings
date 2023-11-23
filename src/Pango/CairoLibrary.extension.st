Extension { #name : 'CairoLibrary' }

{ #category : '*Pango' }
CairoLibrary >> macLibraryName [
	"since both Gtk3 and athens both use Cairo, I need to be sure we are going to 
	use same library (this also applies to freetype, btw)"

	^ GMacLibraryFinder findLibrary: 'libcairo.2.dylib'
]
