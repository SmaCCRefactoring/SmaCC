generated
args: anASTVarArgListNode
	self args notNil
		ifTrue: [ self args parent: nil ].
	args := anASTVarArgListNode.
	self args notNil
		ifTrue: [ self args parent: self ]