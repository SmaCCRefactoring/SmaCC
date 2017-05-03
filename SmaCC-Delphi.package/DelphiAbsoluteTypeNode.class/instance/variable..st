generated
variable: aDelphiProgramNode
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aDelphiProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]