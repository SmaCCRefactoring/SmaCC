generated
list: aPyRootNode
	self list notNil
		ifTrue: [ self list parent: nil ].
	list := aPyRootNode.
	self list notNil
		ifTrue: [ self list parent: self ]