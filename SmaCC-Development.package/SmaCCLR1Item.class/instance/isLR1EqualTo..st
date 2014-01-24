private
isLR1EqualTo: aSmaCCLR1Item
	^self followers size = aSmaCCLR1Item followers size
		and: [self followers allSatisfy: [:each | aSmaCCLR1Item followers includes: each]]