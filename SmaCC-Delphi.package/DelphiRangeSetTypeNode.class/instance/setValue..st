generated
setValue: aDelphiRangeTypeNode
	self setValue notNil
		ifTrue: [ self setValue parent: nil ].
	setValue := aDelphiRangeTypeNode.
	self setValue notNil
		ifTrue: [ self setValue parent: self ]