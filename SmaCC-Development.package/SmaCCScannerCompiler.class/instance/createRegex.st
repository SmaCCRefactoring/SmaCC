compiling-scanner
createRegex
	self addSpecialSymbols.
	self addNormalSymbols.
	self addActions.
	^ self addSpecificREsWithoutActionsTo: self combinedGeneralRegexes