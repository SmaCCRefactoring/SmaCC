generated
fromValue: aDelphiExpressionNode
	self fromValue notNil
		ifTrue: [ self fromValue parent: nil ].
	fromValue := aDelphiExpressionNode.
	self fromValue notNil
		ifTrue: [ self fromValue parent: self ]