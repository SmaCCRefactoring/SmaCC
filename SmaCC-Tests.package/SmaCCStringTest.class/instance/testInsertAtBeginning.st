tests
testInsertAtBeginning
	| string |
	string := SmaCCString on: '12345'.
	string insert: '0' at: 1.
	self assert: string asString = '012345'