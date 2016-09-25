accessing
parseFile: aString
	| stream |
	stream := FileStream readOnlyFileNamed: aString.
	^ [ self parseStream: stream startingAt: self defaultStartingState ]
		ensure: [ stream close ]