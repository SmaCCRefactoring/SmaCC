private
findFirstContext: aContext
	| next context |
	context := aContext.
	[ (next := context findSimilarSender) notNil ] whileTrue: [context := next].
	^ context