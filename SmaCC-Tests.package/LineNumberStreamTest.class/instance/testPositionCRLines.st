tests
testPositionCRLines
	"recall that the column number is that of the most-recently-read character.
	So, if we have just read the newline, and have not yet read the first character 
	of the following line, then the column number should be 0."
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '1\2\3\4')).
	self assert: stream lineNumber equals: 1.
	stream upTo: $5.
	self assert: stream lineNumber equals: 4.
	stream skip: -1.
	self assert: stream peek equals: $4.
	self assert: stream lineNumber equals: 4.
	self assert: stream columnNumber equals: 0.
	self assert: stream next equals: $4.
	self assert: stream columnNumber equals: 1.
	stream position: 0.
	self assert: stream lineNumber equals: 1.
	self assert: stream columnNumber equals: 0.
	stream position: 2.
	self assert: stream peek equals: $2.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 0.
	self assert: stream next equals: $2.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 1