tests
testDeleteLast
	| string |
	string := SmaCCString on: 'asdf'.
	string deleteFrom: 4 to: 4.
	self assert: string asString = 'asd'