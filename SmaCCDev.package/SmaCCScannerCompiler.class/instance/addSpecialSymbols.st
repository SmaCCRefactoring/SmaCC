compiling-scanner
addSpecialSymbols
	grammar tokens keysDo: 
			[:each | 
			(self scannerActionFor: each) notNil 
				ifTrue: [grammar terminalSymbolNamed: each]]