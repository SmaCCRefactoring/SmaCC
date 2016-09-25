printing
printOn: aStream
	| allCharacters |
	characters size = 1
		ifTrue: [ ^ self printCharacter: characters first on: aStream ].
	aStream nextPut: $[.
	allCharacters := characters.
	characters size > 128
		ifTrue:
			[ aStream nextPut: $^.
			allCharacters := ((0 to: SmaCCGrammar maximumCharacterValue)
				collect: [ :each | Character value: each ])
				reject: [ :each | characters includes: each ] ].
	allCharacters do: [ :each | self printCharacter: each on: aStream ].
	aStream nextPut: $]