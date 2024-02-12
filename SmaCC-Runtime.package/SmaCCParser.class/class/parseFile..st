accessing
parseFile: aString
	| stream |
	stream := aString asFileReference readStream.
	^ [ self parseStream: stream startingAt: self defaultStartingState ]
		ensure: [ stream close ]