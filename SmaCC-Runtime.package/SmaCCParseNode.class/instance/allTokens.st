accessing
allTokens
	| tokens |
	tokens := OrderedCollection new.
	self allTokensInto: tokens.
	^ tokens
		asSortedCollection: [ :a :b | a startPosition < b startPosition ]