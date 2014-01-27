instance
forNode: aSmaCCParseNode rewriter: aSmaCCRewriteEngine continuation: aBlock
	^(self new)
		forNode: aSmaCCParseNode
			rewriter: aSmaCCRewriteEngine
			continuation: aBlock;
		yourself