accessing
setStopPositionForNode: aSmaCCParseNode to: anIndex
	| position current |
	current := aSmaCCParseNode.
	position := self stopPositionForNode: aSmaCCParseNode.
	[ newStops at: current put: anIndex.
	current := current parent.
	current notNil
		and: [ position = (self stopPositionForNode: current) ] ] whileTrue