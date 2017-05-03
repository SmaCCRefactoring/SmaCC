updating
update: aSymbol with: aValue
	super update: aSymbol with: aValue.
	aSymbol = #resultAdded
		ifTrue: [ self addResult: aValue ]