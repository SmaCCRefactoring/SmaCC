generated
filter: aCSExceptionFilterNode
	self filter notNil
		ifTrue: [ self filter parent: nil ].
	filter := aCSExceptionFilterNode.
	self filter notNil
		ifTrue: [ self filter parent: self ]