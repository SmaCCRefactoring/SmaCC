action table
createTransitionTable
	| table |
	table := (1 to: itemSets size)
		collect:
			[ :index | 
			scannerCompiler symbols
				collect: [ :each | self actionForState: index on: each ] ].
	actions := self compressTable: table