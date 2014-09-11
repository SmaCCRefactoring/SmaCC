generated
statement: aPyRootNode
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aPyRootNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]