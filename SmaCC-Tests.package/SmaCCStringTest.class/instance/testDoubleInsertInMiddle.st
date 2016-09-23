tests
testDoubleInsertInMiddle
	| string index |
	string := SmaCCString on: '15'.
	index := string insert: '24' at: 2.
	string insert: '3' at: index + 1.
	self assert: string asString = '12345'