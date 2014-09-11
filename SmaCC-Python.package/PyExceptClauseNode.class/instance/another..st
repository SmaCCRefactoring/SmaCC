generated
another: aPyRootNode
	self another notNil
		ifTrue: [ self another parent: nil ].
	another := aPyRootNode.
	self another notNil
		ifTrue: [ self another parent: self ]