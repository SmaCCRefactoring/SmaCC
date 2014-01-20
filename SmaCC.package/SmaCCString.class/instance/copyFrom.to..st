copying
copyFrom: startIndex to: stopIndex
	| result |
	result := self class new.
	self
		copyFrom: startIndex
		to: stopIndex
		into: result
		at: 1.
	^result