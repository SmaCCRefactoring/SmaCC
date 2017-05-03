testing
matches: aString
	^ (super matches: aString)
		or: [ (Smalltalk at: aString asSymbol ifAbsent: [ nil ])
				ifNil: [ false ]
				ifNotNil: [ :class | (class isKindOf: SmaCCParseNode class) and: [ match canMatch: class ] ] ]