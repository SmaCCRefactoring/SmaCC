generated
else: anASTPythonNode
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := anASTPythonNode.
	self else notNil
		ifTrue: [ self else parent: self ]