generated
simple: aPyRootNode
	self simple notNil
		ifTrue: [ self simple parent: nil ].
	simple := aPyRootNode.
	self simple notNil
		ifTrue: [ self simple parent: self ]