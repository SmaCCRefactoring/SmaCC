tests
testMultipleInserts
	| string |
	string := SmaCCString on: '125'.
	string insert: '3' at: 3.
	string insert: '4' at: 3.
	self assert: string asString = '12345'