generated
positiveIntConst: anASTPositiveIntConstNode
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: nil ].
	positiveIntConst := anASTPositiveIntConstNode.
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: self ]