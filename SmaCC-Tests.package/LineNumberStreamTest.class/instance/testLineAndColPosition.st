tests
testLineAndColPosition
	"The point of this test is to confirm that lineAndColFor: corresponds
	to lineNUmberFor: and columnNumberFor:"
	| stream |
	stream := SmaCCLineNumberStream on: (ReadStream on: 
					(self addCRLFsTo: '123456789\123456789\123456789\123456789')).
	self assert: stream position equals: 0.
	self assert: stream columnNumber equals: 0.
	self assert: stream lineNumber equals: 1.
	1 to: stream size do: [ :each | 	| nextCh |
		nextCh := stream next.
		self assert: (stream lineAndCol) 
				equals: stream lineNumber @ stream columnNumber
	]