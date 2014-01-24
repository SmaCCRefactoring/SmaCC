matching
match: aSmaCCParseNode inContext: aDictionary
	self class = aSmaCCParseNode class
		ifFalse: [ ^ false ].
	(self tokenVariables
		allSatisfy: [ :each | (self perform: each) match: (aSmaCCParseNode perform: each) inContext: aDictionary ])
		ifFalse: [ ^ false ].
	(self nodeVariables
		allSatisfy: [ :each | (self perform: each) match: (aSmaCCParseNode perform: each) inContext: aDictionary ])
		ifFalse: [ ^ false ].
	(self compositeTokenVariables
		allSatisfy: [ :each | self matchCollection: (self perform: each) to: (aSmaCCParseNode perform: each) inContext: aDictionary ])
		ifFalse: [ ^ false ].
	^ self compositeNodeVariables
		allSatisfy: [ :each | self matchCollection: (self perform: each) to: (aSmaCCParseNode perform: each) inContext: aDictionary ]