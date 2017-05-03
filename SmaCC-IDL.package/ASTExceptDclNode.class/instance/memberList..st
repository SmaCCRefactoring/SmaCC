generated
memberList: anASTMemberListNode
	self memberList notNil
		ifTrue: [ self memberList parent: nil ].
	memberList := anASTMemberListNode.
	self memberList notNil
		ifTrue: [ self memberList parent: self ]