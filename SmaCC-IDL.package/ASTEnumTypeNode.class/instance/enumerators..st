generated
enumerators: anASTEnumeratorsNode
	self enumerators notNil
		ifTrue: [ self enumerators parent: nil ].
	enumerators := anASTEnumeratorsNode.
	self enumerators notNil
		ifTrue: [ self enumerators parent: self ]