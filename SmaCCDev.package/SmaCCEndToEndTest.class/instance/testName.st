tests
testName
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<name> : \w+; <whitespace> : \s+; 
			%root FooNode;
			A : name ''nameNode'' {{FooANode}} ;
			name : simple | composite ;
			simple : <name> ''name'' {{FooNameNode}};
			composite : name ''base'' "." ''period'' <name> ''name'' {{FooFullNameNode}}; '.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'a.b.c'.
	self assert: node nameNode _name value = 'c'.
	self assert: node nameNode parent == node.
	self assert: node nameNode base _name value = 'b'.
	self assert: node nameNode base parent == node nameNode.
	self assert: node nameNode base base _name value = 'a'.
	self assert: node nameNode base base parent == node nameNode base