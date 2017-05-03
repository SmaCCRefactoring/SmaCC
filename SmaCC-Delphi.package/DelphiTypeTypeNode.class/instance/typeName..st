generated
typeName: aDelphiQualifiedNameNode
	self typeName notNil
		ifTrue: [ self typeName parent: nil ].
	typeName := aDelphiQualifiedNameNode.
	self typeName notNil
		ifTrue: [ self typeName parent: self ]