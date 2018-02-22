tests-unicode
testSpecialCharacterOxfordBrackets
	"A very strange test: for ⟧, SmaCC generates a strange between:and: that includes ⟦ ."
	
	"Test in fact for a side effect issue in SmaCCIntegerSet>>#addAll:"

	| parserCompiler maxValue searcher found |
	[ String with: (Character value: 16rFF00) ]
		on: Error
		do: [ :ex | ^ self ].	"Unicode characters not supported"
	maxValue := SmaCCGrammar maximumCharacterValue.
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%unicode;
			<open> :  ⟦ ;
			<close> :  ⟧ ;
			begin :  "+" <open>  {true} | "-" <close> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	found := false.
	searcher := RBParseTreeSearcher new.
	searcher
		matches:
			'currentCharacter
		between: (Character value: 10214)
		and: (Character value: 10215)'
		do: [ :aNode :answer | found := true ].
	#TestScanner asClass methods
		do: [ :e | searcher executeTree: e parseTree initialAnswer: nil ].
	self deny: found.
	self deny: (self parserClass parse: '-⟧').
	self assert: (self parserClass parse: '+⟦') ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]