initialize-release
createScannerPage
	| aScannerPage |
	scannerCodeHolder := SmaCCCodeHolder owner: self
				ownerAcceptSelector: #acceptScannerCode:notifying:.
	aScannerPage := scannerCodeHolder contentsMorph.
	aScannerPage
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	self tabList 
		addPage: (self tabList newContentMorph 
			addMorph: aScannerPage; 
			yourself) 
		label: 'Scanner'