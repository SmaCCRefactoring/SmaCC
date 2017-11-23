tests
testSingleLine
	| stream |
	stream := SmaCCLineNumberStream on: (ReadStream on: 'this is a test').
	stream do: [ :each | 
		self assert: stream lineNumber = 1 description: 'line number should be 1'.
		self assert: stream columnNumber equals: stream position ]