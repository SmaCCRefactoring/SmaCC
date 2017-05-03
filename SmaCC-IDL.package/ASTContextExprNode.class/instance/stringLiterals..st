generated
stringLiterals: anASTStringLiteralsNode
	self stringLiterals notNil
		ifTrue: [ self stringLiterals parent: nil ].
	stringLiterals := anASTStringLiteralsNode.
	self stringLiterals notNil
		ifTrue: [ self stringLiterals parent: self ]