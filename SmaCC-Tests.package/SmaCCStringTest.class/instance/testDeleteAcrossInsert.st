tests
testDeleteAcrossInsert
	| string |
	string := SmaCCString on: '1233345'.
	string insert: '234' at: 5.
	string deleteFrom: 4 to: 5.
	self assert: string asString = '12345'