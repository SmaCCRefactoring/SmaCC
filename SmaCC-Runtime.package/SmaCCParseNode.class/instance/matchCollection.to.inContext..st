matching
matchCollection: receiverCollection to: argumentCollection inContext: aDictionary
	^ self
		matchCollection: receiverCollection
		index: 1
		to: argumentCollection
		index: 1
		inContext: aDictionary