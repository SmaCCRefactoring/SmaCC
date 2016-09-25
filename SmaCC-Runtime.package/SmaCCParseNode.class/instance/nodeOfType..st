accessing
nodeOfType: aSmaCCParseNodeClassOrCollection
	| isCollection |
	isCollection := aSmaCCParseNodeClassOrCollection isKindOf: Collection.
	^ self
		lookupNode:
			[ :each | 
			isCollection
				ifTrue:
					[ aSmaCCParseNodeClassOrCollection
						anySatisfy: [ :class | each isKindOf: class ] ]
				ifFalse: [ each isKindOf: aSmaCCParseNodeClassOrCollection ] ]