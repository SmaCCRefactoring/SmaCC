private
buildScanner: aScannerClass andParser: aParserClass
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: (self definitionFrom: aParserClass selector: #definitionComment).
	parserCompiler compileInto: aScannerClass andParser: aParserClass.
	^ parserCompiler