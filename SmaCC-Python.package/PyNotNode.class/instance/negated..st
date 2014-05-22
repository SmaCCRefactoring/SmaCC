generated
negated: aPyRootNode
	self negated notNil
		ifTrue: [ self negated parent: nil ].
	negated := aPyRootNode.
	self negated notNil
		ifTrue: [ self negated parent: self ]