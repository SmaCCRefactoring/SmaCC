generated
negated: anASTPythonNode
	self negated notNil
		ifTrue: [ self negated parent: nil ].
	negated := anASTPythonNode.
	self negated notNil
		ifTrue: [ self negated parent: self ]