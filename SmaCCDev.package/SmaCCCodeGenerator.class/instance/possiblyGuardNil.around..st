compiling
possiblyGuardNil: each around: aBlock
	each isAlwaysAssigned
		ifTrue: [aBlock value]
		ifFalse:
			[self nextPutLine: (self notNilCheckFor: (self variableReference: each in: self receiverName)).
			aBlock ensure: [self nextPutStatement: self endConditionalString]]