tests
testEmptyLines
	| stream |
	stream := SmaCCLineNumberStream 
				on: (ReadStream on: (self addCRsTo: '\\\')).
	1 to: 4
		do: 
			[:each | 
			self assert: stream lineNumber = each.
			stream upTo: Character cr]