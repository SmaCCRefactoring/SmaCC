generated
else: anASTElseNode
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := anASTElseNode.
	self else notNil
		ifTrue: [ self else parent: self ]