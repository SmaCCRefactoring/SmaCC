generated
variable: aGstVariableNode
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aGstVariableNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]