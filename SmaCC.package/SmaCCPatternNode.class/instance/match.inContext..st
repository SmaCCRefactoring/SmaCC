matching
match: aSmaCCParseNode inContext: aDictionary
	^(aDictionary at: self ifAbsentPut: [aSmaCCParseNode]) = aSmaCCParseNode
		and: [patternToken testBlock value: aSmaCCParseNode]