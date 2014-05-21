generated
arg2: anASTPythonNode
	self arg2 notNil
		ifTrue: [ self arg2 parent: nil ].
	arg2 := anASTPythonNode.
	self arg2 notNil
		ifTrue: [ self arg2 parent: self ]