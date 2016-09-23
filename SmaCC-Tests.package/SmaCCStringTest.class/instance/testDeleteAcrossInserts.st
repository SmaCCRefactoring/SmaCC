tests
testDeleteAcrossInserts
	| string startIndex stopIndex |
	string := SmaCCString on: '16'.
	startIndex := string insert: '233' at: 2.
	stopIndex := string insert: '445' at: 2.
	string insert: 'asdf' at: stopIndex.
	string deleteFrom: startIndex + 2 to: stopIndex.
	self assert: string asString = '123456'