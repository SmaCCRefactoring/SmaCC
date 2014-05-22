generated
arg2: aPyRootNode
	self arg2 notNil
		ifTrue: [ self arg2 parent: nil ].
	arg2 := aPyRootNode.
	self arg2 notNil
		ifTrue: [ self arg2 parent: self ]