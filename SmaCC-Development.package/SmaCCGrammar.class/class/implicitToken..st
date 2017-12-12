accessing
implicitToken: aString
	| symbol node |
	symbol := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	(Character canUnderstand: symbol)
		ifFalse: [ ^ nil ].
	node := SmaCCCharacterRENode characters: (self charactersFor: symbol).
	node position: SmallInteger maxVal.	"Implicit nodes have least precedence"
	^ node