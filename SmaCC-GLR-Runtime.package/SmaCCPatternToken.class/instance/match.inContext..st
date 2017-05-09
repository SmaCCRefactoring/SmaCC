matching
match: aSmaCCToken inContext: aDictionary
	^ (aSmaCCToken isKindOf: SmaCCToken)
		and:
			[ (aDictionary at: self ifAbsentPut: [ aSmaCCToken ]) = aSmaCCToken
				and: [ self testBlock value: aSmaCCToken ] ]