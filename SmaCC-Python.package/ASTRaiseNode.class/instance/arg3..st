generated
arg3: anASTPythonNode
	self arg3 notNil
		ifTrue: [ self arg3 parent: nil ].
	arg3 := anASTPythonNode.
	self arg3 notNil
		ifTrue: [ self arg3 parent: self ]