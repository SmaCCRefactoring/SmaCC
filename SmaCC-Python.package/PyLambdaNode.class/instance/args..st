generated
args: aPyVarArgListNode
	self args notNil
		ifTrue: [ self args parent: nil ].
	args := aPyVarArgListNode.
	self args notNil
		ifTrue: [ self args parent: self ]