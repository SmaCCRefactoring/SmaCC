generated
getAccessor: aCSGetAccessorDeclarationNode
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: nil ].
	getAccessor := aCSGetAccessorDeclarationNode.
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: self ]