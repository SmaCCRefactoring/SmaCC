private
performReduceMethod: aSymbol with: items
	^ aSymbol last == $:
		ifTrue: [ self perform: aSymbol with: items ]
		ifFalse: [ self perform: aSymbol ]