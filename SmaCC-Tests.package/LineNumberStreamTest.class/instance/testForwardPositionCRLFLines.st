tests
testForwardPositionCRLFLines
	| stream |
	stream := SmaCCLineNumberStream 
				on: (ReadStream on: (self addCRLFsTo: '1\2\3\4')).
	stream position: 3.
	self assert: stream lineNumber = 2.
	self assert: stream columnNumber = 1