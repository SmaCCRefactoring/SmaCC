generated
atom: aPyRootNode
	self atom notNil
		ifTrue: [ self atom parent: nil ].
	atom := aPyRootNode.
	self atom notNil
		ifTrue: [ self atom parent: self ]