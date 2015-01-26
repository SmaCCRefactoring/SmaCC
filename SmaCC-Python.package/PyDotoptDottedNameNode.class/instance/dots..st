generated
dots: aPyDotsNode
	self dots notNil
		ifTrue: [ self dots parent: nil ].
	dots := aPyDotsNode.
	self dots notNil
		ifTrue: [ self dots parent: self ]