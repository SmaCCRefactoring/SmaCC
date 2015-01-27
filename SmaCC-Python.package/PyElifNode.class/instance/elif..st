generated
elif: aPyRootNode
	self elif notNil
		ifTrue: [ self elif parent: nil ].
	elif := aPyRootNode.
	self elif notNil
		ifTrue: [ self elif parent: self ]