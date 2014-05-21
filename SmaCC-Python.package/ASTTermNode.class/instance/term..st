generated
term: anASTPythonNode
	self term notNil
		ifTrue: [ self term parent: nil ].
	term := anASTPythonNode.
	self term notNil
		ifTrue: [ self term parent: self ]