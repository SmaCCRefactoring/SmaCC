tests
testInsertAtEnd
	| string |
	string := SmaCCString on: '12345'.
	string insert: '6' at: 6.
	self assert: string asString = '123456'