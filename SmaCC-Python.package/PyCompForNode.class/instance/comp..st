generated
comp: aPyRootNode
	self comp notNil
		ifTrue: [ self comp parent: nil ].
	comp := aPyRootNode.
	self comp notNil
		ifTrue: [ self comp parent: self ]