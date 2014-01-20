tests
testPositionCRLFLines
	| stream |
	stream := SmaCCLineNumberStream 
				on: (ReadStream on: (self addCRLFsTo: '1\2\3\4')).
	self assert: stream lineNumber = 1.
	stream upTo: $5.
	self assert: stream lineNumber = 4.
	stream position: 0.
	self assert: stream lineNumber = 1.
	self assert: stream columnNumber = 1.
	stream position: 3.
	self assert: stream lineNumber = 2.
	self assert: stream columnNumber = 1