compiling-scanner
sortedTransitionsForNode: aSmaCCNode
	^ aSmaCCNode transitions
		asSortedCollection:
			[ :a :b | 
			a isCharacterTransition
				and:
					[ b isCharacterTransition not
						or:
							[ | aPairs bPairs |
							aPairs := self minMaxPairsFor: a without: #().
							bPairs := self minMaxPairsFor: b without: #().
							aPairs size < bPairs size
								or:
									[ aPairs size = bPairs size
										and:
											[ a transitionObjects size < b transitionObjects size
												or: [ a transitionObjects size = b transitionObjects size and: [ a <= b ] ] ] ] ] ] ]