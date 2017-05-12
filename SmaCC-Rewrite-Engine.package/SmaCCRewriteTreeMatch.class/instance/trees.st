accessing
trees
	^ trees
		ifNil: [ trees := [ self parserClass
				parseAndCacheAll: source
				startingAt: self startingStateIndex ]
				on: SmaCCParserError
				do: [ :ex | ex return: #() ] ]