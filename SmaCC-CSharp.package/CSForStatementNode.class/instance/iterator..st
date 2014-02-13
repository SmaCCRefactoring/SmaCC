generated
iterator: aCSStatementListNode
	self iterator notNil
		ifTrue: [ self iterator parent: nil ].
	iterator := aCSStatementListNode.
	self iterator notNil
		ifTrue: [ self iterator parent: self ]