accessing
allStartingSymbols
	"Return all starting symbols with the default starting symbol listed first."

	| startingSymbols default |
	default := self startSymbol.
	startingSymbols := otherStartingSymbols copy.
	startingSymbols remove: default symbol ifAbsent: [  ].
	startingSymbols := startingSymbols
		collect:
			[ :each | 
			(self newStartingSymbolNamed: each name)
				addProduction:
					(self newRHS
						add: each;
						yourself);
				yourself ].
	startingSymbols addFirst: default.
	^ startingSymbols