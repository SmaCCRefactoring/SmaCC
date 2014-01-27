matching
codeMatches: aSmaCCParseNode
	(code isNil or: [code isEmpty]) ifTrue: [^true].
	^(enableDebug and: [SmaCCRewriteProcessor debug])
		ifTrue: [self methodMatches: aSmaCCParseNode]
		ifFalse: [[self methodMatches: aSmaCCParseNode] on: Error do: [:ex | ex return: false]]