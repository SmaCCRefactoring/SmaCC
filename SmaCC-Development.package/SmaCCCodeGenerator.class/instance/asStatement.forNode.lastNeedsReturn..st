compiling-scanner
asStatement: methodMap forNode: aSmaCCNode lastNeedsReturn: aBoolean
	| transitions seen |
	aSmaCCNode hasSimpleLoop
		ifTrue: [ self nextPutLine: self startDoWhileLoop ].
	self writeMatchingCodeFor: aSmaCCNode.
	transitions := self sortedTransitionsForNode: aSmaCCNode.
	seen := (transitions notEmpty
		ifTrue: [ transitions first setClass ]
		ifFalse: [ Set ]) new.
	transitions
		do:
			[ :each | 
			each to = aSmaCCNode
				ifTrue:
					[ self
						nextPutStatement: (self endDoWhileLoopWithClause: (each dispatchTo: self seen: seen)) ]
				ifFalse:
					[ self
						nextPutLine: (self startIfWithClause: (each dispatchTo: self seen: seen)).
					(methodMap at: each to ifAbsent: [ nil ])
						ifNil:
							[ self
								asStatement: methodMap
								forNode: each to
								lastNeedsReturn: each ~= transitions last ]
						ifNotNil:
							[ :methodCall | 
							self
								nextPutStatement: (self return: (self send: methodCall to: self receiverName)) ].
					self nextPutStatement: self endConditionalString ].
			seen addAll: each transitionObjects ].
	(aBoolean
		and: [ aSmaCCNode transitions notEmpty or: [ aSmaCCNode action isNil ] ])
		ifTrue:
			[ self
				nextPutStatement: (self return: (self send: #reportLastMatch to: self receiverName)) ]