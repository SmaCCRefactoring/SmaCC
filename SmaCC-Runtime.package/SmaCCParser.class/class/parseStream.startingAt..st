accessing
parseStream: aStream startingAt: anInteger
	| parser |
	parser := self on: aStream.
	parser setStartingState: anInteger.
	^ parser parse