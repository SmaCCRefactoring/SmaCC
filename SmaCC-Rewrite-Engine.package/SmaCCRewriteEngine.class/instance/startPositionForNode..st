accessing
startPositionForNode: aSmaCCParseNode
	((aSmaCCParseNode isKindOf: SmaCCParseNode) and: [aSmaCCParseNode parent isNil]) ifTrue: [^source startIndex].
	^newStarts at: aSmaCCParseNode ifAbsent: [aSmaCCParseNode startPosition]