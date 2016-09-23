generated
then: aSwiftBlockNode
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := aSwiftBlockNode.
	self then notNil
		ifTrue: [ self then parent: self ]