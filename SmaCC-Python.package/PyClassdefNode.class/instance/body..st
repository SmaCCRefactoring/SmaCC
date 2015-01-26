generated
body: aPySuiteNode
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aPySuiteNode.
	self body notNil
		ifTrue: [ self body parent: self ]