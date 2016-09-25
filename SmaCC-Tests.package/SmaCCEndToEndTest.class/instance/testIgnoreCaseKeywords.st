tests
testIgnoreCaseKeywords
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<identifier> : [a-z_]+ ; <whitespace> : \s+ ;
			Start ::= "Foo" {true} | <identifier> <identifier> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'FOo').
	self deny: (self parserClass parse: 'FoObAr ASDS')