generated
testlist: aPyTestlistNode
	self testlist notNil
		ifTrue: [ self testlist parent: nil ].
	testlist := aPyTestlistNode.
	self testlist notNil
		ifTrue: [ self testlist parent: self ]