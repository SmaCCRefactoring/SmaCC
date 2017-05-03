accessing
method
	method isNil
		ifTrue: [ method := SmaCCRewriteMatchContext compiledMethodFor: self source ].
	^ method