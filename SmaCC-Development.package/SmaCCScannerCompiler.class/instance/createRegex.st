compiling-scanner
createRegex
	self addSpecialSymbols.
	self addNormalSymbols.
	self addActions.
	^ self combinedRegexes	"self addSpecificREsWithoutActionsTo: self combinedGeneralRegexes"