private
rewrite: aSmaCCParseNode
	self rewriteNode: aSmaCCParseNode.
	^source copyFrom: (self startPositionForNode: aSmaCCParseNode) to: (self stopPositionForNode: aSmaCCParseNode)