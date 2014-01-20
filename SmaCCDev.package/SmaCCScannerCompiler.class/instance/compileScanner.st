compiling-scanner
compileScanner
	| regex |
	self addSpecialSymbols.
	self addNormalSymbols.
	self addActions.
	self compileTokenIdMethods.
	regex := self addSpecificREsWithoutActionsTo: self combinedGeneralRegexes.
	self compileMethodsFor: regex withSelectors: self computeSelectorMap