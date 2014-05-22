generated
arguments: aPyVarArgListNode
	self arguments notNil
		ifTrue: [ self arguments parent: nil ].
	arguments := aPyVarArgListNode.
	self arguments notNil
		ifTrue: [ self arguments parent: self ]