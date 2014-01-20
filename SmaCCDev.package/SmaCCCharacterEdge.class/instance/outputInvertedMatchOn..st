compiling
outputInvertedMatchOn: aStream 
	| char |
	char := Character value: ((0 to: SmaCCGrammar maximumCharacterValue) 
						detect: [:each | (transitionObjects includes: (Character value: each)) not]).
	aStream
		nextPutAll: 'currentCharacter ~= ';
		nextPutAll: char storeString