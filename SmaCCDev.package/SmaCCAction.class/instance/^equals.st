comparing
= anObject
	^self class = anObject class and: [self symbol = anObject symbol and: [self rhs = anObject rhs]]