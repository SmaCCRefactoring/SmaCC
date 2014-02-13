generated
expression: aCSProgramNode
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSProgramNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]