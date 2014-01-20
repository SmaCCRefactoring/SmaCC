reduction table
reduceTable
	| table nonterminals |
	table := OrderedCollection new.
	nonterminals := scannerCompiler symbols reject: [:each | each isTerminal].
	nonterminals do: 
			[:each | 
			each productionsDo: 
					[:rhs | 
					table add: (Array 
								with: (scannerCompiler symbols indexOf: each)
								with: rhs size
								with: (rhs compileSourceFor: each in: parserClass))]].
	^table