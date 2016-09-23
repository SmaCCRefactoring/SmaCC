generated
receiver: aGstValueNode
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aGstValueNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]