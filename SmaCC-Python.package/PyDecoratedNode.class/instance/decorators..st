generated
decorators: aPyDecoratorsNode
	self decorators notNil
		ifTrue: [ self decorators parent: nil ].
	decorators := aPyDecoratorsNode.
	self decorators notNil
		ifTrue: [ self decorators parent: self ]