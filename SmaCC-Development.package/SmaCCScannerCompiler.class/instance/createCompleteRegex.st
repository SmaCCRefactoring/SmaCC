compiling-scanner
createCompleteRegex
	"Create the complete regex, do not treat keywords as special cases."

	self addSpecialSymbols.
	self addNormalSymbols.
	self addActions.
	^ self combinedRegexes