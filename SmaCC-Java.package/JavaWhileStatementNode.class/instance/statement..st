generated
statement: aJavaStatementNode
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJavaStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]