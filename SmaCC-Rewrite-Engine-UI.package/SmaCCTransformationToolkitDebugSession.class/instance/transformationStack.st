accessing
transformationStack
	| stack context rewrite |
	stack := OrderedCollection new.
	context := interruptedContext.
	[ context isNil ]
		whileFalse: [ (self isRewriteContext: context)
				ifTrue: [ rewrite := self rewriteForContext: context.
					rewrite notNil
						ifTrue: [ stack
								add:
									{rewrite.
									context} ] ].
			context := context sender ].
	^ stack