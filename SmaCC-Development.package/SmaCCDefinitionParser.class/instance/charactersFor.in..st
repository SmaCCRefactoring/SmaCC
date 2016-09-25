private
charactersFor: aStream in: aToken
	| characters char endCharacters |
	aStream atEnd
		ifTrue: [ self reportCharacterBlockErrorForToken: aToken ].
	char := aStream next.
	characters := char == $\
		ifTrue: [ (self nodeFor: aStream) characters ]
		ifFalse: [ OrderedCollection with: char ].
	(characters size = 1 and: [ aStream peekFor: $- ])
		ifFalse: [ ^ characters ].
	endCharacters := self charactersFor: aStream in: aToken.
	endCharacters size > 1
		ifTrue: [ self reportCharacterBlockErrorForToken: aToken ].
	^ (characters first asInteger to: endCharacters first asInteger)
		collect: [ :each | Character value: each ]