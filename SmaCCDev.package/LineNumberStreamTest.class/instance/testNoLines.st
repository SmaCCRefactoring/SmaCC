tests
testNoLines
	| stream index |
	stream := SmaCCLineNumberStream on: (ReadStream on: 'this is a test').
	self assert: stream lineNumber = 1.
	index := 1.
	stream do: 
			[:each | 
			self assert: stream lineNumber = 1.
			index := index + 1.
			self assert: stream columnNumber = index]