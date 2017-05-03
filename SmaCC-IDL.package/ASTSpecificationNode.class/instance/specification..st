generated
specification: anASTSpecificationNode
	self specification notNil
		ifTrue: [ self specification parent: nil ].
	specification := anASTSpecificationNode.
	self specification notNil
		ifTrue: [ self specification parent: self ]