generated
two: anASTPythonNode
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := anASTPythonNode.
	self two notNil
		ifTrue: [ self two parent: self ]