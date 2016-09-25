matching
matchCollectionVariables: aCollection to: aSmaCCParseNode inContext: aDictionary
	^ aCollection
		allSatisfy:
			[ :each | 
			self
				matchCollection: (self perform: each)
				to: (aSmaCCParseNode perform: each)
				inContext: aDictionary ]