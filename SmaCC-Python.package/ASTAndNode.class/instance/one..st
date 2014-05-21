generated
one: anASTPythonNode
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := anASTPythonNode.
	self one notNil
		ifTrue: [ self one parent: self ]