accessing
implicitToken: aString
	| symbol node |
	symbol := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	(Character canUnderstand: symbol)
		ifFalse: [ ^ nil ].
	node := [ SmaCCCharacterRENode characters: (self allCharacters select: [ :each | each perform: symbol ]) ]
		on: NonBooleanReceiver
		do: [ :ex | ^ nil ].
	node position: SmallInteger maxVal.	"Implicit nodes have least precedence"
	^ node