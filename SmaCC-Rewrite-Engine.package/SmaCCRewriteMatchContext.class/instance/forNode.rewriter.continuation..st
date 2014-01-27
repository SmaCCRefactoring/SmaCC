initialize
forNode: aSmaCCParseNode rewriter: aSmaCCRewriteEngine continuation: aBlock
	rewriteEngine := aSmaCCRewriteEngine.
	match := aSmaCCParseNode.
	continuation := aBlock.
	nodes := Dictionary new.
	strings := Dictionary new