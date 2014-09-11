generated
compound: aPyRootNode
	self compound notNil
		ifTrue: [ self compound parent: nil ].
	compound := aPyRootNode.
	self compound notNil
		ifTrue: [ self compound parent: self ]