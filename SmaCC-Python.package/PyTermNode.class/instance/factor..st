generated
factor: aPyRootNode
	self factor notNil
		ifTrue: [ self factor parent: nil ].
	factor := aPyRootNode.
	self factor notNil
		ifTrue: [ self factor parent: self ]