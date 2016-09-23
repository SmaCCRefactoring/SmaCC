matching
matchVariables: aCollection to: aSmaCCParseNode inContext: aDictionary
	^ aCollection
		allSatisfy:
			[ :each | 
			| myValue otherValue |
			myValue := self perform: each.
			otherValue := aSmaCCParseNode perform: each.
			myValue isNil
				ifTrue: [ otherValue isNil ]
				ifFalse: [ myValue match: otherValue inContext: aDictionary ] ]