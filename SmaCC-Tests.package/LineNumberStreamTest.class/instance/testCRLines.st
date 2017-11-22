tests
testCRLines
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		4 timesRepeat: [ | ch |	
				ch := stream next.
				self assert: stream columnNumber equals: ch digitValue ].
		stream upTo: Character cr ]