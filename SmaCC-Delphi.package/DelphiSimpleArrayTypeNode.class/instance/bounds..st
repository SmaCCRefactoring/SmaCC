generated
bounds: aDelphiExpressionNode
	self bounds notNil
		ifTrue: [ self bounds parent: nil ].
	bounds := aDelphiExpressionNode.
	self bounds notNil
		ifTrue: [ self bounds parent: self ]