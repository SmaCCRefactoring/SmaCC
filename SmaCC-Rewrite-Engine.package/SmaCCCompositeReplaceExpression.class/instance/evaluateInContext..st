evaluating
evaluateInContext: aSmaCCRewriteMatchContext
	| result |
	result := aSmaCCRewriteMatchContext smaccStringClass new.
	self expressions
		reverseDo:
			[ :each | result addPrefix: (each evaluateInContext: aSmaCCRewriteMatchContext) ].
	^ result