accessing
lookupNode: aBlock
	| current |
	current := self.
	[ current isNil or: [ aBlock value: current ] ]
		whileFalse: [ current := current parent ].
	^ current