evaluating
evaluateInContext: aSmaCCRewriteMatchContext
	| value |
	value := self method
		valueWithReceiver: aSmaCCRewriteMatchContext
		arguments: #().
	^ (value isString or: [ value isKindOf: SmaCCString ])
		ifTrue: [ value ]
		ifFalse:
			[ aSmaCCRewriteMatchContext
				sourceFrom: aSmaCCRewriteMatchContext match startPosition
				to: aSmaCCRewriteMatchContext match stopPosition ]