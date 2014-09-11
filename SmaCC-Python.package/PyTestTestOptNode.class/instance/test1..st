generated
test1: aPyRootNode
	self test1 notNil
		ifTrue: [ self test1 parent: nil ].
	test1 := aPyRootNode.
	self test1 notNil
		ifTrue: [ self test1 parent: self ]