tests
testInsertOnEmptyString
	| string |
	string := SmaCCString on: ''.
	string insert: '123456' at: 1.
	self assert: string asString = '123456'