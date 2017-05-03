generated
qualifiedName: aDelphiQualifiedNameNode
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: nil ].
	qualifiedName := aDelphiQualifiedNameNode.
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: self ]