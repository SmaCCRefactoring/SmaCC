generated
statements: aPyStatementsNode
	self statements notNil
		ifTrue: [ self statements parent: nil ].
	statements := aPyStatementsNode.
	self statements notNil
		ifTrue: [ self statements parent: self ]