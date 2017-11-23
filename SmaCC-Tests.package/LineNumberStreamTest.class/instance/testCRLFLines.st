tests
testCRLFLines
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber equals: each.
		4 timesRepeat: [ | ch |	
				ch := stream next.
				self assert: stream columnNumber equals: ch digitValue ].
		stream upTo: Character lf ]