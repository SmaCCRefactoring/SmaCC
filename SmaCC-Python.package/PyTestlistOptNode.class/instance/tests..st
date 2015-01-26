generated
tests: aPyTestlistNode
	self tests notNil
		ifTrue: [ self tests parent: nil ].
	tests := aPyTestlistNode.
	self tests notNil
		ifTrue: [ self tests parent: self ]