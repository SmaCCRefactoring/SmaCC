accessing
parseFile: aString
	| stream |
	stream := FileStream read: aString.
	^ [ self parseStream: stream startingAt: self defaultStartingState ]
		ensure: [ stream close ]