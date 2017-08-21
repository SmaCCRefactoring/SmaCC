accessing
trees
	^ trees
		ifNil: [ trees := [ startingState isNil
				ifTrue: [ self parserClass parseAndCacheAllPossibleStates: source ]
				ifFalse: [ self parserClass parseAndCacheAll: source startingAt: self startingStateIndex ] ]
				on: SmaCCParserError
				do: [ :ex | ex return: #() ] ]