accessing
topParent
	| current |
	current := self.
	[ current parent notNil ] whileTrue: [ current := current parent ].
	^ current