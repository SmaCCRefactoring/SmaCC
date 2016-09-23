tests
testMultipleInsertsAndDeletes
	| string indices last |
	string := SmaCCString on: ''.
	last := 0.
	indices := (1 to: 5)
		collect: [ :each | last := string insert: each printString , 'X' at: last + 1 ].
	string deleteFrom: last + 1 to: indices first + 1.
	self assert: string asString = '12345'