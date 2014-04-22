accessing
parseFile: aFile
	^ aFile readStreamDo: [ :stream |
		 self parseStream: stream startingAt: self defaultStartingState ]
		