private
menuItemFor: aSymbol
	^ optionsMenu menuItems detect: [ :each | each selector = aSymbol ]