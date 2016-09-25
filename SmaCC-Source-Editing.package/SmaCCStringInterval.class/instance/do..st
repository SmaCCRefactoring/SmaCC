iterating
do: aBlock
	| current |
	current := self.
	[ current isSentinel ]
		whileFalse: [ aBlock value: current.
			current := current next ]