accessing
updateStopPositionFor: aSmaCCParseNode to: stopPosition whenEqualTo: anIndex
	anIndex = (self stopPositionForNode: aSmaCCParseNode)
		ifTrue: [ self
				setStopPositionForNode: aSmaCCParseNode
				to: stopPosition ]