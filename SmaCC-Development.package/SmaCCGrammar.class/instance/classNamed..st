accessing
classNamed: aSymbol
	^classDefinitions at: aSymbol ifAbsentPut: [SmaCCNodeClassDefinition named: aSymbol grammar: self]