matching
codeMatches: aSmaCCRewriteMatchContext
	(code isNil or: [ code isEmpty ])
		ifTrue: [ ^ true ].
	self class haltBlock
		ifNotNil: [ :block | 
			(block value: rewrite value: aSmaCCRewriteMatchContext match)
				ifTrue: [ ^ (aSmaCCRewriteMatchContext debugMethod: self method message: rewrite displayString) == true ] ].
	^ (enableDebug and: [ SmaCCRewriteProcessor debug ])
		ifTrue: [ self methodMatches: aSmaCCRewriteMatchContext ]
		ifFalse: [ [ self methodMatches: aSmaCCRewriteMatchContext ]
				on: Error
				do: [ :ex | ex return: false ] ]