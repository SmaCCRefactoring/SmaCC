generated
expr: aPyRootNode
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aPyRootNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]