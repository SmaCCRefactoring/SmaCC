generated
elsif: anASTElifNode
	self elsif notNil
		ifTrue: [ self elsif parent: nil ].
	elsif := anASTElifNode.
	self elsif notNil
		ifTrue: [ self elsif parent: self ]