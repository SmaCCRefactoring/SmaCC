changing
changed: aSymbol
	super changed: aSymbol.
	self announcer announce: aSymbol.
	self modified