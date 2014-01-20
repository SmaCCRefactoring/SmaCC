private
parseCharacterBlock: aToken 
	| characters aStream invert |
	aStream := ReadStream 
				on: (aToken value copyFrom: 2 to: aToken value size - 1).
	characters := OrderedCollection new.
	invert := aStream peekFor: $^.
	[aStream atEnd] 
		whileFalse: [characters addAll: (self charactersFor: aStream in: aToken)].
	^String withAll: (invert 
				ifTrue: [self allCharacters reject: [:each | characters includes: each]]
				ifFalse: [characters])