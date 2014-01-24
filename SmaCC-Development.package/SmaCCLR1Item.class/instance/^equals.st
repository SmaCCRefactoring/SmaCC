comparing
= aSmaCCLR1Item
	^self class == aSmaCCLR1Item class
		and: [location = aSmaCCLR1Item location and: [rhs == aSmaCCLR1Item rhs and: [self symbol == aSmaCCLR1Item symbol]]]