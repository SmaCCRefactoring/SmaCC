action table
createTransitionTable
	| table optimizedTable |
	table := (1 to: itemSets size)
		collect: [ :index | 
			scannerCompiler symbols
				collect: [ :each | self actionForState: index on: each ] ].
	optimizedTable := self optimizeTransitionTable: table.
	actions := self compressTable: optimizedTable