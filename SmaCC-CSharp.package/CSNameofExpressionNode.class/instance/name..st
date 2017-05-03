generated
name: aCSExpressionNode
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aCSExpressionNode.
	self name notNil
		ifTrue: [ self name parent: self ]