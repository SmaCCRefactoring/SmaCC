generated
variable: aJSProgramNode
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJSProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]