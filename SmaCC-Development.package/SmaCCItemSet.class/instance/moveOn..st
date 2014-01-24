accessing
moveOn: aSmaCCSymbol
	| anItemSet |
	anItemSet := self class new.
	anItemSet grammar: grammar.
	anItemSet addPrevious: self.
	anItemSet type: type.
	self do: [:each | each nextSymbol == aSmaCCSymbol ifTrue: [anItemSet add: each moveNext]].
	^anItemSet