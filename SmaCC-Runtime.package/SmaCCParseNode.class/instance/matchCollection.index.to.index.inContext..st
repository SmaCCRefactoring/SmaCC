matching
matchCollection: matchNodes index: matchIndex to: programNodes index: programIndex inContext: aDictionary
	| node currentIndex currentDictionary nodes |
	matchNodes size < matchIndex
		ifTrue: [ ^ programNodes size < programIndex ].
	node := matchNodes at: matchIndex.
	node isListMatch
		ifTrue:
			[ currentIndex := programIndex - 1.
			[ currentDictionary := aDictionary copy.
			programNodes size < currentIndex
				or:
					[ (self
						matchCollection: matchNodes
						index: matchIndex + 1
						to: programNodes
						index: currentIndex + 1
						inContext: currentDictionary)
						and:
							[ nodes := programNodes copyFrom: programIndex to: currentIndex.
							(node match: nodes inContext: currentDictionary)
								ifTrue:
									[ currentDictionary
										keysAndValuesDo: [ :key :value | aDictionary at: key put: value ].
									^ true ].
							false ] ] ] whileFalse: [ currentIndex := currentIndex + 1 ].
			^ false ].
	programNodes size < programIndex
		ifTrue: [ ^ false ].
	(node match: (programNodes at: programIndex) inContext: aDictionary)
		ifFalse: [ ^ false ].
	^ self
		matchCollection: matchNodes
		index: matchIndex + 1
		to: programNodes
		index: programIndex + 1
		inContext: aDictionary