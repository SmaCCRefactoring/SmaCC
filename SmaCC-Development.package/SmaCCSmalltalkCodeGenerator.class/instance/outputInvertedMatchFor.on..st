compiling-scanner
outputInvertedMatchFor: aSmaCCCharacterEdge on: stream
	| char |
	char := Character
		value:
			((0 to: SmaCCGrammar maximumCharacterValue)
				detect:
					[ :each | 
					(aSmaCCCharacterEdge transitionObjects
						includes: (Character value: each)) not ]).
	stream
		nextPutAll: 'currentCharacter ~~ ';
		nextPutAll: char storeString