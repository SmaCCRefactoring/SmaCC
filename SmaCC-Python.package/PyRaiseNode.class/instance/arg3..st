generated
arg3: aPyRootNode
	self arg3 notNil
		ifTrue: [ self arg3 parent: nil ].
	arg3 := aPyRootNode.
	self arg3 notNil
		ifTrue: [ self arg3 parent: self ]