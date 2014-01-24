printing
edgeLabel
	^transitionObjects isNil
		ifTrue: ['epsilon']
		ifFalse: [transitionObjects inject: '' into: [:sum :each | sum , each printString]]