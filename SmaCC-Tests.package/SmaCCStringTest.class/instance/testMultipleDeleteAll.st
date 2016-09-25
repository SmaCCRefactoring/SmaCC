tests
testMultipleDeleteAll
	| string |
	string := SmaCCString on: 'asdf'.
	#(1 3 4 2) do: [ :each | string deleteCharacter: each ].
	self assert: string asString = ''