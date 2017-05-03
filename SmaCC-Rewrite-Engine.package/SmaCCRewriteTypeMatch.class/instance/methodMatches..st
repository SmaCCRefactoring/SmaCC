matching
methodMatches: aSmaCCRewriteMatchContext
	^ (self method valueWithReceiver: aSmaCCRewriteMatchContext arguments: #()) = true