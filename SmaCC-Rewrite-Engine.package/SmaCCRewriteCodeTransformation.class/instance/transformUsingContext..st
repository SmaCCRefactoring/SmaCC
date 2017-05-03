transforming
transformUsingContext: aSmaCCRewriteMatchContext
	self class haltBlock
		ifNotNil: [ :block | 
			(block value: rewrite value: aSmaCCRewriteMatchContext match)
				ifTrue: [ ^ aSmaCCRewriteMatchContext debugMethod: self method message: rewrite displayString ] ].
	^ self method valueWithReceiver: aSmaCCRewriteMatchContext arguments: #()