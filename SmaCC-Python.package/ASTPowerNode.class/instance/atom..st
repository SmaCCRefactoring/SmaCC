generated
atom: anASTPythonNode
	self atom notNil
		ifTrue: [ self atom parent: nil ].
	atom := anASTPythonNode.
	self atom notNil
		ifTrue: [ self atom parent: self ]