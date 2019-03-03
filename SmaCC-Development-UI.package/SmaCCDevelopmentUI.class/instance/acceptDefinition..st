actions
acceptDefinition: aStringOrText
	^ [ self parserClass
		ifNotNil: [ | parserCompiler |
			parserCompiler := SmaCCGrammarCompiler new.
			parserCompiler
				category: self packageString;
				scannerClass: self scannerClassString;
				parserClass: self parserClassString.
			parserCompiler codeGenerator
				compileDefinitionComment: aStringOrText asString.
			parserCompiler codeGenerator compileChanges ].
	SmaCCGrammarCompiler new buildDefinition: aStringOrText.
	true ]
		on: SmaCCParserError
		do: [ :ex | 
			self
				displayError: ex description
				at: ex tag position
				in: self definitionTextModel.
			ex return: false ]