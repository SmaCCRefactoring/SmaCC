private
intervalContaining: anIndex
	| prev next |
	(cachedInterval isNil or: [ cachedInterval isSentinel ])
		ifTrue: [ prev := lastSentinel previous.
			next := firstSentinel next ]
		ifFalse:
			[ (cachedInterval containsIndex: anIndex)
				ifTrue: [ ^ cachedInterval ].
			prev := cachedInterval previous.
			next := cachedInterval next ].
	[ prev isSentinel not or: [ next isSentinel not ] ]
		whileTrue:
			[ (prev isSentinel not and: [ prev containsIndex: anIndex ])
				ifTrue: [ ^ cachedInterval := prev ].
			(next isSentinel not and: [ next containsIndex: anIndex ])
				ifTrue: [ ^ cachedInterval := next ].
			prev := prev previous.
			next := next next ].
	^ lastSentinel