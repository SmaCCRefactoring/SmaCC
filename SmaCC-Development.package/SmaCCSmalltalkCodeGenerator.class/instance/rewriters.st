compiling
rewriters
	| rewriters |
	rewriters := OrderedCollection new.
	rewriters add: self commonIfTrueCodeRewriter.
	rewriters add: self optimizationRewriter.
	rewriters add: self scanStringRewriter.
	rewriters add: self timesRepeatRewriter.
	^ rewriters