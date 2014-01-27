evaluating
evaluateInContext: aSmaCCRewriteMatchContext
	| result |
	result := aSmaCCRewriteMatchContext smaccStringClass new.
	self addPostfixTo: result inContext: aSmaCCRewriteMatchContext.
	result addPrefix: (aSmaCCRewriteMatchContext stringFor: name value).
	self addPrefixTo: result inContext: aSmaCCRewriteMatchContext.
	^result