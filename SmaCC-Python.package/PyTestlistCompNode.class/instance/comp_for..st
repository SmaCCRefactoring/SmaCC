generated
comp_for: aPyCompForNode
	self comp_for notNil
		ifTrue: [ self comp_for parent: nil ].
	comp_for := aPyCompForNode.
	self comp_for notNil
		ifTrue: [ self comp_for parent: self ]