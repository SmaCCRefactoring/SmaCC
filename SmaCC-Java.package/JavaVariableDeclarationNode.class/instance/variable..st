generated
variable: aJavaProgramNode
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJavaProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]