accessing-methods
methodNamed: aSymbol
	^ methods at: aSymbol ifAbsent: [ nil ]