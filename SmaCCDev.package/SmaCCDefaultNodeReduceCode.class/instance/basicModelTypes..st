private
basicModelTypes: aSet
	^self index = 0
		ifTrue: [Array with: (self model classFor: nil class)]
		ifFalse: [self basicModelTypes: aSet forIndex: self index]