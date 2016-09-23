tests
testMultipleDeleteWhitespaceAfter
	| string |
	string := SmaCCString on: '0 asdf 9'.
	6 to: 3 by: -1 do:
		[ :i | 
		string
			deleteWhitespaceAfterIndex: i;
			deleteCharacter: i ].
	self assert: '0 9' = string asString