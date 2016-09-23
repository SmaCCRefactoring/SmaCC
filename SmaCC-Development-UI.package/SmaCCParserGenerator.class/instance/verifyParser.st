private
verifyParser
	^ [ SmaCCGrammarCompiler new
		codeGenerator: self codeGeneratorClass new;
		buildDefinition: self definition.
	true ]
		on: SmaCCParserError
		do:
			[ :ex | 
			self switchToDefinition.
			self displayError: ex description at: ex tag position.
			ex return: false ]