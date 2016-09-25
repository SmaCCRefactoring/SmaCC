matching
match: aSmaCCParseNode inContext: aDictionary
	self class = aSmaCCParseNode class
		ifFalse: [ ^ false ].
	(self
		matchVariables: self tokenVariables
		to: aSmaCCParseNode
		inContext: aDictionary)
		ifFalse: [ ^ false ].
	(self
		matchVariables: self nodeVariables
		to: aSmaCCParseNode
		inContext: aDictionary)
		ifFalse: [ ^ false ].
	(self
		matchCollectionVariables: self compositeTokenVariables
		to: aSmaCCParseNode
		inContext: aDictionary)
		ifFalse: [ ^ false ].
	^ self
		matchCollectionVariables: self compositeNodeVariables
		to: aSmaCCParseNode
		inContext: aDictionary