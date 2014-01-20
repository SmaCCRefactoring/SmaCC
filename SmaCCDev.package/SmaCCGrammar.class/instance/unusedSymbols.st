accessing
unusedSymbols
	| nonTerminals problemSymbols todo symbol |
	nonTerminals := self symbols reject: [:each | each isTerminal].
	problemSymbols := nonTerminals asSet.
	problemSymbols remove: self startSymbol.
	todo := OrderedCollection with: self startSymbol.
	[todo isEmpty] whileFalse: 
			[symbol := todo removeFirst.
			symbol productionsDo: 
					[:rhs | 
					rhs do: 
							[:each | 
							each isTerminal 
								ifFalse: 
									[(problemSymbols includes: each) 
										ifTrue: 
											[todo add: each.
											problemSymbols remove: each]]]]].
	^problemSymbols