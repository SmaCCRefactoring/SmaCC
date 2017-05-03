generated
unaryOperator: anASTUnaryOperatorNode
	self unaryOperator notNil
		ifTrue: [ self unaryOperator parent: nil ].
	unaryOperator := anASTUnaryOperatorNode.
	self unaryOperator notNil
		ifTrue: [ self unaryOperator parent: self ]