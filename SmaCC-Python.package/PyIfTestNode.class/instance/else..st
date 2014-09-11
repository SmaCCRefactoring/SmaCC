generated
else: aPyRootNode
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aPyRootNode.
	self else notNil
		ifTrue: [ self else parent: self ]