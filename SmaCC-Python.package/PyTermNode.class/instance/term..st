generated
term: aPyRootNode
	self term notNil
		ifTrue: [ self term parent: nil ].
	term := aPyRootNode.
	self term notNil
		ifTrue: [ self term parent: self ]