generated
attrDcl: anASTAttrDclNode
	self attrDcl notNil
		ifTrue: [ self attrDcl parent: nil ].
	attrDcl := anASTAttrDclNode.
	self attrDcl notNil
		ifTrue: [ self attrDcl parent: self ]