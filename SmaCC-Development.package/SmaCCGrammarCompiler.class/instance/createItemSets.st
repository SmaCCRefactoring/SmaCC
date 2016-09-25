action table
createItemSets
	| itemSet newState index |
	startingStateMap := Dictionary new.
	grammar calculateFirstSets.
	itemSets := OrderedCollection new.
	grammar allStartingSymbols
		do:
			[ :each | 
			itemSets add: (grammar initialItemSetFor: each).
			startingStateMap at: each put: itemSets size ].
	shiftTable := Dictionary new.
	index := 1.
	[ index <= itemSets size ]
		whileTrue:
			[ itemSet := itemSets at: index.
			grammar symbols
				do:
					[ :each | 
					newState := itemSet moveOn: each.
					newState notEmpty
						ifTrue:
							[ shiftTable
								at: (self shiftTableKeyForIndex: index symbol: each)
								put: (self indexOfState: newState) ] ].
			index := index + 1 ]