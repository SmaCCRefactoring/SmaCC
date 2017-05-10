tests-parse tree creation
testTypeInferenceWithRHSNumberReturn
	"This example exhibit suspicious extraction behavior."

	"Errors:
		- FooExpressionNode has instance variables left and right.
		- FooExpressionNode otherVariables isn't empty."
		
	"Now this test ensures that a return with a rhs node number is properly recognized.
	Fix should also cope with multiple returns."

	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node;
			%left "+" "-" ;
			Expression : Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
				| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
				| Number {^''1''}
				| "(" ''leftParen'' Expression ")" ''rightParen'' {{Expression}} ;
			Number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: 'FooExpressionNode' asClass new otherVariables isEmpty.
"	self
		assert: ('FooExpressionNode' asClass allInstVarNames includes: 'left') not.
	self
		assert: ('FooExpressionNode' asClass allInstVarNames includes: 'right') not"