tests
testInsertInMiddle
	| string |
	string := SmaCCString on: '1245'.
	string insert: '3' at: 3.
	self assert: string asString = '12345'