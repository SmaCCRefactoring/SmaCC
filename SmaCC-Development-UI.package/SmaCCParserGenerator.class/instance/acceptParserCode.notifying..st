actions
acceptParserCode: aStringOrAText notifying: aRequestor 
	| scannerText |
	scannerText := self scannerCodeHolder contentsMorph text.
	^ [SmaCCGrammarCompiler new buildScanner: scannerText andParser: aStringOrAText.
	true]
		on: SmaCCParserError
		do: [:ex | 
			self tabList selectedPageIndex: 2.
			self 
				displayError: ex description
				at: ex tag position
				notifying: aRequestor.
			ex return: false]