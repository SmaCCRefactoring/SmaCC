generated
body: aPyRootNode
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aPyRootNode.
	self body notNil
		ifTrue: [ self body parent: self ]