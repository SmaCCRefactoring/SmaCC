accessing
implicitToken: aString
	"Implicit token definition may fail and returns nil"

	| symbol node |
	symbol := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	(Character canUnderstand: symbol)
		ifFalse: [ ^ nil ].
	node := [ SmaCCCharacterRENode characters: (self allCharacters select: [ :each | each perform: symbol ]) ]
		on: Exception
		do: [ :ex | nil ].
	node ifNotNil: [ node position: SmallInteger maxVal	"Implicit nodes have least precedence" ].
	^ node