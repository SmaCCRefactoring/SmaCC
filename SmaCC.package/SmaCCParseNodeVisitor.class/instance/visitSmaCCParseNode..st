private
visitSmaCCParseNode: aSmaCCParseNode
	self acceptNodes: aSmaCCParseNode sortedChildren.
	^aSmaCCParseNode