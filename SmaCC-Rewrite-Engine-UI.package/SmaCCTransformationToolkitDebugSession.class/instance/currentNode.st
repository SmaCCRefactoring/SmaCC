accessing
currentNode
	| context |
	context := interruptedContext.
	[ context isNil ]
		whileFalse: [ (self isRewriteContext: context)
				ifTrue: [ ^ context receiver match ].
			context := context sender ].
	^ nil