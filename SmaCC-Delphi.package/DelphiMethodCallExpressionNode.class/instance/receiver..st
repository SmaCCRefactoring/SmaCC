generated
receiver: aDelphiExpressionNode
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aDelphiExpressionNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]