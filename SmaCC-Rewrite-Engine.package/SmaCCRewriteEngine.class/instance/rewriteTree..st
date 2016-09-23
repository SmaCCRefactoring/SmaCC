rewriting
rewriteTree: aSmaCCParseNode
	source isNil
		ifTrue: [ source := aSmaCCParseNode completeSource copy ].
	^ (self rewrite: aSmaCCParseNode) asString