generated
scopedNames: anASTScopedNamesNode
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: nil ].
	scopedNames := anASTScopedNamesNode.
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: self ]