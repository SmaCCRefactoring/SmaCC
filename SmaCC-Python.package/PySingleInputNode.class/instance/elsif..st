generated
elsif: aPyRootNode
	self elsif notNil
		ifTrue: [ self elsif parent: nil ].
	elsif := aPyRootNode.
	self elsif notNil
		ifTrue: [ self elsif parent: self ]