testing
testComments
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<a> : /* q */ /***/ /****/ a # b 
;' andParser: '/* */ /***/ /****/
#this is a comment
begin : <a> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'a')