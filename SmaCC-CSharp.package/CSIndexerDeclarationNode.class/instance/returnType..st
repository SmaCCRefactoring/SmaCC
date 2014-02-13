generated
returnType: aCSTypeNode
	self returnType notNil
		ifTrue: [ self returnType parent: nil ].
	returnType := aCSTypeNode.
	self returnType notNil
		ifTrue: [ self returnType parent: self ]