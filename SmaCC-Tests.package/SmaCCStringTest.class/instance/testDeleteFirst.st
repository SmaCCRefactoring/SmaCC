tests
testDeleteFirst
	| string |
	string := SmaCCString on: 'asdf'.
	string deleteFrom: 1 to: 1.
	self assert: string asString = 'sdf'