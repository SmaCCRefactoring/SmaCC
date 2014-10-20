public
isUnder: aSmaCCAbstractRewrite
	| current |
	current := self.
	[ current notNil and: [ current ~= aSmaCCAbstractRewrite ] ] whileTrue: [ current := current parent ].
	^ current notNil