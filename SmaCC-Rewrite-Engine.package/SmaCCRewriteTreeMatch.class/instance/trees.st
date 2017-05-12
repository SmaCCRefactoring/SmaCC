accessing
trees
	^ trees
		ifNil: [ trees := [ self parserClass
				parseAndCacheAll: source
				startingAt: self startingStateIndex ] ]