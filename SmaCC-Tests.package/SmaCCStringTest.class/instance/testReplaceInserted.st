tests
testReplaceInserted
	| string index |
	string := SmaCCString on: '1245'.
	index := string insert: 'x' at: 3.
	string replaceFrom: index to: index with: '3'.
	self assert: string asString = '12345'