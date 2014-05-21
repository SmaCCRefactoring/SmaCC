generated
arg1: anASTPythonNode
	self arg1 notNil
		ifTrue: [ self arg1 parent: nil ].
	arg1 := anASTPythonNode.
	self arg1 notNil
		ifTrue: [ self arg1 parent: self ]