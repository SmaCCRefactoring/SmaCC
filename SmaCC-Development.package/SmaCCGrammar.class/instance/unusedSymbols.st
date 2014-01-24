accessing
unusedSymbols
	| nonTerminals problemSymbols todo |
	nonTerminals := self symbols reject: [:each | each isTerminal].
	todo := OrderedCollection withAll: self allStartingSymbols.
	problemSymbols := nonTerminals asSet reject: [:each | todo includes: each].
	[todo isEmpty]
		whileFalse:
			[todo removeFirst
				productionsDo:
					[:rhs | 
					rhs
						do:
							[:each | 
							(problemSymbols includes: each)
								ifTrue:
									[todo add: each.
									problemSymbols remove: each]]]].
	^problemSymbols