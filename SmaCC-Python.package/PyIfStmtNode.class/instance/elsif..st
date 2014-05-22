generated
elsif: aPyElifNode
	self elsif notNil
		ifTrue: [ self elsif parent: nil ].
	elsif := aPyElifNode.
	self elsif notNil
		ifTrue: [ self elsif parent: self ]