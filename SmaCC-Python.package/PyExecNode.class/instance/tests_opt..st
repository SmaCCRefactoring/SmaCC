generated
tests_opt: aPyTestTestOptNode
	self tests_opt notNil
		ifTrue: [ self tests_opt parent: nil ].
	tests_opt := aPyTestTestOptNode.
	self tests_opt notNil
		ifTrue: [ self tests_opt parent: self ]