visiting
visitSmaCCParseNode: aSmaCCParseNode
	self acceptNodes: aSmaCCParseNode sortedChildren.
	^ aSmaCCParseNode