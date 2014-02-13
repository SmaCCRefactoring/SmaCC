generated
body: aCSBlockStatementNode
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aCSBlockStatementNode.
	self body notNil
		ifTrue: [ self body parent: self ]