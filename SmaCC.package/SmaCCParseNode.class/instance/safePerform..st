private
safePerform: aSymbol
	^ (self respondsTo: aSymbol)
		ifTrue: [ self perform: aSymbol ]
		ifFalse: [ nil ]