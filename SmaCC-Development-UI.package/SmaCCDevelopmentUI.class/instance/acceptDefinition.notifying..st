actions
acceptDefinition: aStringOrAText notifying: aRequestor
	^ [ self parserClass
		ifNotNil: [ | parserCompiler |
			parserCompiler := SmaCCGrammarCompiler new.
			parserCompiler
				category: self packageString;
				scannerClass: self scannerClassString;
				parserClass: self parserClassString.
			parserCompiler codeGenerator
				compileDefinitionComment: aStringOrAText asString.
			parserCompiler codeGenerator compileChanges ].
	SmaCCGrammarCompiler new buildDefinition: aStringOrAText.
	true ]
		on: SmaCCParserError
		do: [ :ex | 
			self
				displayError: ex description
				at: ex tag position
				notifying: aRequestor.
			ex return: false ]