generated
statement: aSwiftStatementNode
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aSwiftStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]