matching
match: aSmaCCRewriteMatchContext
	| dictionary |
	(aSmaCCRewriteMatchContext match isKindOf: nodeClass) ifFalse: [^nil].
	(self codeMatches: aSmaCCRewriteMatchContext) ifFalse: [^nil].
	dictionary := Dictionary new.
	aSmaCCRewriteMatchContext match
		allGettersDo:
			[:each | dictionary at: (SmaCCPatternToken value: each asString) put: (aSmaCCRewriteMatchContext match perform: each)].
	^dictionary