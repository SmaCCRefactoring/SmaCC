generated
factor: anASTPythonNode
	self factor notNil
		ifTrue: [ self factor parent: nil ].
	factor := anASTPythonNode.
	self factor notNil
		ifTrue: [ self factor parent: self ]