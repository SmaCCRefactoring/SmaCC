tests
testDeleteUpTo
	| string |
	string := SmaCCString on: '123456'.
	#(1 3) do: [ :each | string deleteCharacter: each ].
	string deleteUpTo: 5.
	self assert: string asString = '56'