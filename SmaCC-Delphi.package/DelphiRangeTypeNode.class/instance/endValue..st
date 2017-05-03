generated
endValue: aDelphiExpressionNode
	self endValue notNil
		ifTrue: [ self endValue parent: nil ].
	endValue := aDelphiExpressionNode.
	self endValue notNil
		ifTrue: [ self endValue parent: self ]