generated
value: aGstValueNode
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aGstValueNode.
	self value notNil
		ifTrue: [ self value parent: self ]