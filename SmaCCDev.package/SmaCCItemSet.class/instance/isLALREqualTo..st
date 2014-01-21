private
isLALREqualTo: aSmaCCItemSet
	^aSmaCCItemSet size = self size and: [self allSatisfy: [:each | aSmaCCItemSet includes: each]]