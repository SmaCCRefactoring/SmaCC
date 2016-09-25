accessing
emptySymbols
	^ self symbols
		select: [ :each | each isTerminal not and: [ each isEmpty ] ]