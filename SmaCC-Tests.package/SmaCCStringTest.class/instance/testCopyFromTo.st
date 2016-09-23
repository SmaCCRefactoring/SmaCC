tests
testCopyFromTo
	| string |
	string := SmaCCString on: '1245'.
	string insert: '3' at: 3.
	self assert: (string copyFrom: 2 to: 3) asString = '234'