generated
tests: aPyRootNode
	self tests notNil
		ifTrue: [ self tests parent: nil ].
	tests := aPyRootNode.
	self tests notNil
		ifTrue: [ self tests parent: self ]