generated
else: aPySuiteNode
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aPySuiteNode.
	self else notNil
		ifTrue: [ self else parent: self ]