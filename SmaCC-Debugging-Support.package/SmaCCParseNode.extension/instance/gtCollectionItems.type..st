*SmaCC-Debugging-Support
gtCollectionItems: aCollection type: aSymbol
	^ (1 to: aCollection size) collect: [ :i | Array with: i printString with: aSymbol with: (aCollection at: i) ]