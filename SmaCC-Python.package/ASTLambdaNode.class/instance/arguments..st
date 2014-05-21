generated
arguments: anASTVarArgListNode
	self arguments notNil
		ifTrue: [ self arguments parent: nil ].
	arguments := anASTVarArgListNode.
	self arguments notNil
		ifTrue: [ self arguments parent: self ]