generated
elifs_opt: aPyElifNode
	self elifs_opt notNil
		ifTrue: [ self elifs_opt parent: nil ].
	elifs_opt := aPyElifNode.
	self elifs_opt notNil
		ifTrue: [ self elifs_opt parent: self ]