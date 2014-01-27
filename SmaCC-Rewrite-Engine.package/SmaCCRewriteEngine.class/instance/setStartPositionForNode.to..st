accessing
setStartPositionForNode: aSmaCCParseNode to: anIndex
	| position current |
	current := aSmaCCParseNode.
	position := self startPositionForNode: aSmaCCParseNode.
	[newStarts at: current put: anIndex.
	current := current parent.
	current notNil and: [position = (self startPositionForNode: current)]] whileTrue