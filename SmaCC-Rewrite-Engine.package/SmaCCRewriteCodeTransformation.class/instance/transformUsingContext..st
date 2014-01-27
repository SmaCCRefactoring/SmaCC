public
transformUsingContext: aSmaCCRewriteMatchContext
	(SmaCCRewriteProcessor haltBlock value: rewrite value: aSmaCCRewriteMatchContext match)
		ifTrue:
			[Processor activeProcess
				debug: 'Debugging ' , rewrite displayString
				topFrame: Processor activeProcess topFrame
				resumable: true].
	^self method valueWithReceiver: aSmaCCRewriteMatchContext arguments: #()