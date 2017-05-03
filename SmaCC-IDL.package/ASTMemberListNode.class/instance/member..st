generated
member: anASTMemberNode
	self member notNil
		ifTrue: [ self member parent: nil ].
	member := anASTMemberNode.
	self member notNil
		ifTrue: [ self member parent: self ]