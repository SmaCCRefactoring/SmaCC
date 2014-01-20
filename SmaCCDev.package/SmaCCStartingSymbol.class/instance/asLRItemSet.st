accessing
asLRItemSet
	| itemSet |
	itemSet := SmaCCItemSet new.
	productions do: 
			[:each | 
			itemSet add: (SmaCCLR1Item 
						symbol: self
						rhs: each
						follow: ((SmaCCSymbolSet new)
								add: self class empty;
								yourself))].
	^itemSet