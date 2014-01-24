accessing
possibleMatches
	| matches |
	matches := OrderedCollection new.
	self possibleMatchesDo: [:each | matches add: each].
	^matches