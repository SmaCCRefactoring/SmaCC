accessing
updateStartPositionFor: aSmaCCParseNode to: startPosition whenEqualTo: anIndex
	anIndex = (self startPositionForNode: aSmaCCParseNode)
		ifTrue: [ self
				setStartPositionForNode: aSmaCCParseNode
				to: startPosition ]