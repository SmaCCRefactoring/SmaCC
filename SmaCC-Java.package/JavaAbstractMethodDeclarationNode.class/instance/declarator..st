generated
declarator: aJavaProgramNode
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aJavaProgramNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]