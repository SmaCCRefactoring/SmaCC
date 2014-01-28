public
loadRewrites: aString
	[| rewrites |
	rewrites := rewriteFiles at: aString ifAbsentPut: [SmaCCRewriteRuleFileParser parseFile: aString].
	rewrites isUpToDate ifTrue: [^rewrites].
	rewriteFiles removeKey: aString] repeat