generated
arguments: aPyTestlistOptNode
	self arguments notNil
		ifTrue: [ self arguments parent: nil ].
	arguments := aPyTestlistOptNode.
	self arguments notNil
		ifTrue: [ self arguments parent: self ]