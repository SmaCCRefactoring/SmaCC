tests
testUnderstandingOfPosition
	"The point of this test is to make clear that stream position answers the
	index of the character most-recently read from the stream.  Similarly, in
	the classToBeTested, stream columNumber is the column number of the most-
	recently read character."
	| stream |
	stream := ReadStream on: '123456789'.
	self assert: stream position equals: 0.
	1 to: stream size do: [ :each | 	| nextCh |
		nextCh := stream next.
		self assert: stream position equals: each.
		self assert: stream position equals: nextCh digitValue
	].
	stream := SmaCCLineNumberStream on: (ReadStream on: '123456789').
	self assert: stream position equals: 0.
	self assert: stream columnNumber equals: 0.
	1 to: stream size do: [ :each | 	| nextCh |
		nextCh := stream next.
		self assert: stream position equals: each.
		self assert: stream columnNumber equals: each.
		self assert: stream columnNumber equals: nextCh digitValue
	]