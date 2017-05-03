generated
typeDcl: anASTTypeDclNode
	self typeDcl notNil
		ifTrue: [ self typeDcl parent: nil ].
	typeDcl := anASTTypeDclNode.
	self typeDcl notNil
		ifTrue: [ self typeDcl parent: self ]