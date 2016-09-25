parsing
parseAll: aString startingAt: anInteger
	| parser |
	parser := self on: (ReadStream on: aString).
	parser setStartingState: anInteger.
	parser parseAll: true.
	^ parser parse