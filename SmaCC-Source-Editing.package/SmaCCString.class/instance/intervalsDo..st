private
intervalsDo: aBlock
	| current |
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse:
			[ current isRemoved
				ifFalse: [ aBlock value: current ].
			current := current next ]