transforming
transformUsingContext: aSmaCCRewriteMatchContext
	| newSource |
	newSource := self expression
		evaluateInContext: aSmaCCRewriteMatchContext.
	aSmaCCRewriteMatchContext
		replace: aSmaCCRewriteMatchContext match
		with: newSource