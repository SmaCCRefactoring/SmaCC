tests
testDeleteWhitespaceBeforeAfter
	| string |
	string := SmaCCString on: '0 asdf 9'.
	string deleteWhitespaceBeforeIndex: 4.
	self assert: string asString = '0 asdf 9'.
	string deleteWhitespaceAfterIndex: 4.
	self assert: string asString = '0 asdf 9'.
	string deleteWhitespaceBeforeIndex: 3.
	self assert: string asString = '0asdf 9'.
	string deleteWhitespaceAfterIndex: 6.
	self assert: string asString = '0asdf9'