accessing
doesNotUnderstand: aMessage
	aMessage arguments size = 0 ifTrue: [^self propertyAt: aMessage selector].
	aMessage arguments size = 1
		ifTrue:
			[| selector |
			selector := (aMessage selector first: aMessage selector size - 1) asSymbol.
			^self propertyAt: selector put: aMessage arguments first].
	^super doesNotUnderstand: aMessage