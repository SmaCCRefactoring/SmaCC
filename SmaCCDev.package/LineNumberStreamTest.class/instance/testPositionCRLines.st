tests
testPositionCRLines
	| stream |
	stream := SmaCCLineNumberStream 
				on: (ReadStream on: (self addCRsTo: '1\2\3\4')).
	self assert: stream lineNumber = 1.
	stream upTo: $5.
	self assert: stream lineNumber = 4.
	stream skip: -1.
	self assert: stream lineNumber = 4.
	self assert: stream columnNumber = 1.
	stream position: 0.
	self assert: stream lineNumber = 1.
	self assert: stream columnNumber = 1.
	stream position: 2.
	self assert: stream lineNumber = 2.
	self assert: stream columnNumber = 1