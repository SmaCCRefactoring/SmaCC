generated
args: aPyTestlistOptNode
	self args notNil
		ifTrue: [ self args parent: nil ].
	args := aPyTestlistOptNode.
	self args notNil
		ifTrue: [ self args parent: self ]