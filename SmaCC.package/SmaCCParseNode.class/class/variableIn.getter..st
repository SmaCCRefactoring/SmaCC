accessing
variableIn: aSmaCCParseNode getter: aSymbol
	(aSmaCCParseNode respondsTo: aSymbol) ifTrue: [^aSmaCCParseNode perform: aSymbol].
	^nil