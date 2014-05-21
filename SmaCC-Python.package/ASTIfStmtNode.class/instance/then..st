generated
then: anASTPythonNode
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := anASTPythonNode.
	self then notNil
		ifTrue: [ self then parent: self ]