generated
startValue: aDelphiExpressionNode
	self startValue notNil
		ifTrue: [ self startValue parent: nil ].
	startValue := aDelphiExpressionNode.
	self startValue notNil
		ifTrue: [ self startValue parent: self ]