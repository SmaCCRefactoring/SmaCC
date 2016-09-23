tests
testCombiningDeletedIntervals
	| string intervalCount current |
	string := SmaCCString on: '12345'.
	#(3 2 4) do: [ :each | string deleteCharacter: each ].
	self assert: string asString = '15'.
	intervalCount := 0.
	current := (string instVarNamed: 'firstSentinel') next.
	[ current isSentinel ]
		whileFalse: [ intervalCount := intervalCount + 1.
			current := current next ].
	self assert: intervalCount = 3