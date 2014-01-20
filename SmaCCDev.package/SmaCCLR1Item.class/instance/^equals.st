comparing
= aSmaCCLR1Item 
	^self class == aSmaCCLR1Item class and: 
			[location = aSmaCCLR1Item location 
				and: [rhs == aSmaCCLR1Item rhs and: [symbol == aSmaCCLR1Item symbol]]]