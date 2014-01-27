accessing
stopPositionForNode: aSmaCCParseNode
	((aSmaCCParseNode isKindOf: SmaCCParseNode) and: [aSmaCCParseNode parent isNil]) ifTrue: [^source stopIndex].
	^newStops at: aSmaCCParseNode ifAbsent: [aSmaCCParseNode stopPosition]