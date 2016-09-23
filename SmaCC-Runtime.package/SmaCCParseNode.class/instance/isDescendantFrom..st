testing
isDescendantFrom: aSmaCCNode
	| current |
	current := self.
	[ current isNil or: [ current == aSmaCCNode ] ]
		whileFalse: [ current := current parent ].
	^ current notNil