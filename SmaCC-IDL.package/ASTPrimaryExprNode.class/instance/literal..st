generated
literal: anASTLiteralNode
	self literal notNil
		ifTrue: [ self literal parent: nil ].
	literal := anASTLiteralNode.
	self literal notNil
		ifTrue: [ self literal parent: self ]