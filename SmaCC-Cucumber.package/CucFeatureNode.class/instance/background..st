generated
background: aCucBackgroundNode
	self background notNil
		ifTrue: [ self background parent: nil ].
	background := aCucBackgroundNode.
	self background notNil
		ifTrue: [ self background parent: self ]