accessing
moveOn: aSmaCCSymbol 
	| anItemSet |
	anItemSet := self class new.
	anItemSet type: type.
	self 
		do: [:each | each nextSymbol == aSmaCCSymbol ifTrue: [anItemSet add: each moveNext]].
	^anItemSet