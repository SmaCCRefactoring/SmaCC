accessing
allStartingSymbols
	"Return all starting symbols with the default starting symbol listed first."

	| startingSymbols default |
	default := self startSymbol.
	startingSymbols := otherStartingSymbols copy.
	startingSymbols remove: default ifAbsent: [].
	startingSymbols := startingSymbols collect: 
					[:each | 
					(SmaCCStartingSymbol name: 'B e g i n' , each name)
						addProduction: ((SmaCCRHS new)
									add: each;
									yourself);
						yourself].
	startingSymbols addFirst: default.
	^startingSymbols