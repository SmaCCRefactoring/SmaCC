public
testChildrenWhenNodeTypeNotSpecifiedAndCouldBeToken
	| compiler node values |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '%root Program;
			%prefix Test;
			%suffix Node;
			<id> : [a-zA-Z]+;
			<num> : [0-9]+;
			<whitespace> : [\s]+;
			Start : Expr ";" ;
			Expr : Term ''left'' "+" ''op''  Expr ''right''   {{Binary}}
			     | Term ''left'' "-" ''op'' Expr ''right''        {{Binary}}
			     | Term ;
			Term : Factor ''left'' "*" ''op'' Term ''right'' {{Binary}}
			     | Factor ''left'' "/" ''op'' Term ''right''       {{Binary}}
			     | Factor ;
			Factor : <num> ''value''                  {{Constant}}
			        | <id> ''name'' "(" Expr ''argument'' ")"        {{Function}}
				  | "(" Q ")" ;
			Q : Expr | <id> ;'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '1 + 2;'.
	self assert: node children size = 2.
	values := #('1' '2') asSet.
	node children do: [:each | values remove: each _value value]