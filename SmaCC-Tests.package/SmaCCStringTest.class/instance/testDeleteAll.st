tests
testDeleteAll
	| string |
	string := SmaCCString on: 'asdf'.
	string deleteFrom: 1 to: 4.
	self assert: string asString = ''