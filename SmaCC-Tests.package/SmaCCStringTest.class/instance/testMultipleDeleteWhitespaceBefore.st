tests
testMultipleDeleteWhitespaceBefore
	| string |
	string := SmaCCString on: '0 asdf 9'.
	3 to: 6 do:
		[ :i | 
		string
			deleteWhitespaceBeforeIndex: i;
			deleteCharacter: i ].
	self assert: '0 9' = string asString