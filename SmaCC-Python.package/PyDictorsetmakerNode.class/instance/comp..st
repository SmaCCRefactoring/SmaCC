generated
comp: aPyCompForNode
	self comp notNil
		ifTrue: [ self comp parent: nil ].
	comp := aPyCompForNode.
	self comp notNil
		ifTrue: [ self comp parent: self ]