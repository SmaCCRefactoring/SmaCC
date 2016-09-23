tests
testDeleteUpToEnd
	| string |
	string := SmaCCString on: '123456'.
	#(1 5) do: [ :each | string deleteCharacter: each ].
	string deleteUpToEnd: 3.
	self assert: string asString = '2'