compiling
compileSymbolTypes
	| names |
	names := grammar symbols
		collect:
			[:each | 
			| types |
			types := each modelTypes.
			types remove: (self model classFor: nil class) ifAbsent: [].
			(self commonSupertypeOf: types) name].
	self compileSymbolTypes: names asArray