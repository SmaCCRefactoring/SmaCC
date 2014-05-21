generated
body: anASTPythonNode
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := anASTPythonNode.
	self body notNil
		ifTrue: [ self body parent: self ]