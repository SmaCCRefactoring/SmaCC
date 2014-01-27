initialize
context: aDictionary
	aDictionary
		keysAndValuesDo:
			[:key :value | 
			| cachedString |
			nodes at: key name put: value.
			strings at: key name put: [cachedString ifNil: [cachedString := self computeStringFor: value]]]