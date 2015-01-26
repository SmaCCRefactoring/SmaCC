generated
statement: aPyTestlistNode
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aPyTestlistNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]