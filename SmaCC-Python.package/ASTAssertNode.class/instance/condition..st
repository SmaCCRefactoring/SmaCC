generated
condition: anASTPythonNode
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := anASTPythonNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]