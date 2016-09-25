private
parseCharacterBlock: aToken
	| characters aStream invert node |
	aStream := ReadStream
		on: (aToken value copyFrom: 2 to: aToken value size - 1).
	characters := OrderedCollection new.
	invert := aStream peekFor: $^.
	[ aStream atEnd ]
		whileFalse: [ characters addAll: (self charactersFor: aStream in: aToken) ].
	node := SmaCCCharacterRENode characters: (String withAll: characters).
	invert
		ifTrue: [ node := SmaCCNotRENode on: node ].
	^ node