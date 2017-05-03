generated
setValue: aDelphiExpressionNode
	self setValue notNil
		ifTrue: [ self setValue parent: nil ].
	setValue := aDelphiExpressionNode.
	self setValue notNil
		ifTrue: [ self setValue parent: self ]