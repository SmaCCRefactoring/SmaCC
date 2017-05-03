generated
toValue: aDelphiExpressionNode
	self toValue notNil
		ifTrue: [ self toValue parent: nil ].
	toValue := aDelphiExpressionNode.
	self toValue notNil
		ifTrue: [ self toValue parent: self ]