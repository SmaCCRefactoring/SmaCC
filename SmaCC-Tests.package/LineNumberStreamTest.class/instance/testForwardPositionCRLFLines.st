tests
testForwardPositionCRLFLines
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1\2\3\4')).
	self assert: stream next equals: $1.
	self assert: stream next equals: Character cr.
	self assert: stream next equals: Character lf.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 0