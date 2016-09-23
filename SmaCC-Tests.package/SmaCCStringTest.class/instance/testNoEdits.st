tests
testNoEdits
	| string |
	string := SmaCCString on: 'asdf'.
	self assert: string asString = 'asdf'