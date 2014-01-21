accessing
preferredActionFor: aSmaCCSymbol
	^shiftReduceTable at: aSmaCCSymbol ifAbsent: [nil]