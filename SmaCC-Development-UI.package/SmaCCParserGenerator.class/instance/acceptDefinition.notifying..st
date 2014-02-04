actions
acceptDefinition: aStringOrAText notifying: aRequestor
	^ [ 
	SmaCCGrammarCompiler new buildDefinition: aStringOrAText.
	true ]
		on: SmaCCParserError
		do: [ :ex | 
			self tabList selectedPageIndex: 1.
			self displayError: ex description at: ex tag position notifying: aRequestor.
			ex return: false ]