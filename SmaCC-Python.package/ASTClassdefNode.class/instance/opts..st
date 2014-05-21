generated
opts: anASTPythonNode
	self opts notNil
		ifTrue: [ self opts parent: nil ].
	opts := anASTPythonNode.
	self opts notNil
		ifTrue: [ self opts parent: self ]