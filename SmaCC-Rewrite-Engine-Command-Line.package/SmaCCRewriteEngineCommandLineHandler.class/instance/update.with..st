activation
update: aSymbol with: anObject
	aSymbol = #resultAdded
		ifTrue: [ ^ self finished: anObject ].
	super update: aSymbol with: anObject