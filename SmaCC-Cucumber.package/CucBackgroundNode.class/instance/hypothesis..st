generated
hypothesis: aCucIdentifiersNode
	self hypothesis notNil
		ifTrue: [ self hypothesis parent: nil ].
	hypothesis := aCucIdentifiersNode.
	self hypothesis notNil
		ifTrue: [ self hypothesis parent: self ]