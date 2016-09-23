accessing
asLRItemSet
	| itemSet |
	itemSet := self grammar newItemSet.
	productions
		do:
			[ :each | 
			itemSet
				add:
					(SmaCCLR1Item
						rhs: each
						follow:
							(SmaCCSymbolSet new
								add: grammar emptySymbol;
								yourself)) ].
	^ itemSet