generated
switchBody: anASTSwitchBodyNode
	self switchBody notNil
		ifTrue: [ self switchBody parent: nil ].
	switchBody := anASTSwitchBodyNode.
	self switchBody notNil
		ifTrue: [ self switchBody parent: self ]