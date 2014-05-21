generated
arguments: anASTPythonNode
	self arguments notNil
		ifTrue: [ self arguments parent: nil ].
	arguments := anASTPythonNode.
	self arguments notNil
		ifTrue: [ self arguments parent: self ]