generated
then: aPySuiteNode
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := aPySuiteNode.
	self then notNil
		ifTrue: [ self then parent: self ]