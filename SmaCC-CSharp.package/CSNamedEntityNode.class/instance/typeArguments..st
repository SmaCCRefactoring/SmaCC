generated
typeArguments: aCSTypeArgumentListNode
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: nil ].
	typeArguments := aCSTypeArgumentListNode.
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: self ]