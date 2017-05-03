generated
nullConditionalOperation: aCSExpressionNode
	self nullConditionalOperation notNil
		ifTrue: [ self nullConditionalOperation parent: nil ].
	nullConditionalOperation := aCSExpressionNode.
	self nullConditionalOperation notNil
		ifTrue: [ self nullConditionalOperation parent: self ]