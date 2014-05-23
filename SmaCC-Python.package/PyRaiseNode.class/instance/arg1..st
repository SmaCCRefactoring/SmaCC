generated
arg1: aPyRootNode
	self arg1 notNil
		ifTrue: [ self arg1 parent: nil ].
	arg1 := aPyRootNode.
	self arg1 notNil
		ifTrue: [ self arg1 parent: self ]