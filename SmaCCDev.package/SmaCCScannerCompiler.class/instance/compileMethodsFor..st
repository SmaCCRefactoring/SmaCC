compiling
compileMethodsFor: regex
	| keywordmap dfa selectorMap |
	dfa := regex asDFA.
	selectorMap := self computeSelectorMap.
	keywordmap := self computeKeywordMapFor: dfa.
	codeGenerator selectorMap: selectorMap.
	codeGenerator compileKeywordInitializerUsing: keywordmap.
	codeGenerator compileNode: dfa.
	codeGenerator compileEmptySymbolTokenId: (self symbols indexOf: grammar emptySymbol).
	codeGenerator compileErrorSymbolTokenId: (self symbols indexOf: grammar errorSymbol).
	codeGenerator compileIgnoreCaseMethods