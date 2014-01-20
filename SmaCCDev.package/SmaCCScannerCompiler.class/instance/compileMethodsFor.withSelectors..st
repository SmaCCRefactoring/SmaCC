compiling-scanner
compileMethodsFor: regex withSelectors: selectorMap 
	| keywordmap dfa |
	dfa := regex asDFA.
	keywordmap := self computeKeywordMapFor: dfa.
	self compileKeywordInitializerUsing: keywordmap selectorMap: selectorMap.
	dfa compileInto: scannerClass usingSelectorMap: selectorMap.
	self compileEmptySymbolTokenId.
	self compileErrorSymbolTokenId.
	self compileIgnoreCaseMethod