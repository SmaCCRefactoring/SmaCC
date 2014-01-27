instance
onNode: aSmaCCParseNode rewrite: aSmaCCRewrite
	^(self new)
		nodeClass: aSmaCCParseNode class;
		nodeInterval: (aSmaCCParseNode startPosition to: aSmaCCParseNode stopPosition);
		rewrite: aSmaCCRewrite;
		yourself