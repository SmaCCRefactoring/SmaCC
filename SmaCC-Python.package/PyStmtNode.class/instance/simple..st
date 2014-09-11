generated
simple: aPySimpleStmtNode
	self simple notNil
		ifTrue: [ self simple parent: nil ].
	simple := aPySimpleStmtNode.
	self simple notNil
		ifTrue: [ self simple parent: self ]