generated
arguments: aPyRootNode
	self arguments notNil
		ifTrue: [ self arguments parent: nil ].
	arguments := aPyRootNode.
	self arguments notNil
		ifTrue: [ self arguments parent: self ]