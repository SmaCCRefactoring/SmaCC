accessing
collectionVariableIn: aSmaCCParseNode collectionGetter: aSymbol variableGetter: varSymbol
	(aSmaCCParseNode respondsTo: aSymbol) ifTrue: [^aSmaCCParseNode perform: aSymbol].
	(aSmaCCParseNode respondsTo: varSymbol) ifTrue: [^Array with: (aSmaCCParseNode perform: varSymbol)].
	^#()