generated
block: aDelphiStatementNode
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aDelphiStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]