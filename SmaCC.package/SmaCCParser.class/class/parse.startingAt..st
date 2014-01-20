accessing
parse: aString startingAt: anInteger 
	^self parseStream: (ReadStream on: aString) startingAt: anInteger